class CheckoutController < ApplicationController
  before_action :set_categories
  before_action :verify_and_set_cart

  # GET : checkout page
  def index
    @authy_error = ''
  end

  # POST : make authy request for one touch token
  def request_authy_token
    response = Authy::OneTouch.send_approval_request(
      id: current_user.authy_id,
      message: "Request to authorize Eproduct purchase",
      details: {
        'email' => current_user.email,
        'user_id' => current_user.id,
        'cellphone' => current_user.cellphone
      },
      hidden_details: { ip: '1.1.1.1' },
      seconds_to_expire: 300
    )

    if response.ok?
      @authy_error = ''
      @uuid = response['approval_request']['uuid']
      render :template => '/checkout/verify_authy_token'
    else
      @authy_error = response.errors
      render :index
    end
  end

  # POST place the order if token verified successfully
  def process_order
    if params[:token].present?
      response = Authy::API.verify(:id => current_user.authy_id, :token => params[:token])
      if response.ok?
        place_order(params[:uuid])
      else
        redirect_to checkout_init_path, notice: 'Authy token is invalid.'
      end
    else
      redirect_to checkout_init_path, notice: 'Authy token is invalid.'
    end
  end

  # GET order sccess page
  def order_success
    if params[:order_id].present?
      @order = Order.find(params[:order_id])
    else
      redirect_to root_path
    end
  end

  private
  def verify_and_set_cart
    if current_user.cart.present? && current_user.cart.cart_products.present?
      @cart = current_user.cart
    else
      redirect_to cart_path, notice: 'Unable to process checkout.'
    end
  end

  def place_order uuid
    @order = Order.create({
      user_id: current_user.id,
      order_date: Time.current,
      status: 'pending',
      authy_uuid: uuid,
      total: @cart.total,
      product_count: @cart.product_count
      })

    @cart.cart_products.each do |cart_product|
      product = cart_product.product
      order_product = OrderProduct.create({
        order_id: @order.id,
        product_id: cart_product.product_id,
        price: cart_product.price,
        qty: cart_product.qty,
        status: 'pending'
        })
        SendProductDocMailer.send_product_email(current_user, @order, order_product,  product).deliver_later
    end
    @cart.destroy
    session[:cart_id] = nil
    render template: '/checkout/order_success'
  end

end
