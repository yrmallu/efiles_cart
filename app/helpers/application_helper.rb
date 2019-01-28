module ApplicationHelper
  def title_format str
    str.camelize
  end

  def truncate_str str, length=50
    truncate(str.strip, length: length)
  end

  def is_load_needed?(products)
    products.size > 12
  end

  def is_admin?
    current_user.present? && current_user.admin_role
  end

  def show_cart_info
    if session[:cart_id].present? && cart = Cart.find_by(id: session[:cart_id])
      total, count = cart.total, cart.product_count
    elsif (current_user.present? && current_user.cart.present?)
      user_cart = current_user.cart
      session[:cart_id] = user_cart.id
      total, count = user_cart.total, user_cart.product_count
    else
      session[:cart_id] = nil
      total, count = 0, 0.00
    end
    "Basket: #{count} items $#{total}"
  end

  def render_add_to_basket product
    unless product.out_of_stock
      "<a class='btn btn-primary js-add_to_basket' data-product-id='#{product.id}' href='#'>Add to Basket +</a>"
    else
      "<a class='btn btn-warning' href='#''>Out of Stock</a>"
    end
  end

  def out_of_stock_message(product)
    "<h6 class='text-danger'>This product is out of stock. Please remove this product.</h6>" if product.out_of_stock
  end

  def format_price price
    "$#{number_with_precision(price, :precision => 2)}"
  end

  def user_name
    if is_admin?
      ": Admin"
    elsif current_user.present?
      ": #{current_user.name.camelize}"
    end
  end
end
