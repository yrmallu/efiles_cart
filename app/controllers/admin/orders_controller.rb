class Admin::OrdersController < Admin::BaseController
  skip_before_filter :verify_authenticity_token, :only => [:update]
  before_action :set_order, only: [:show, :edit, :destroy]

  # GET /admin/orders
  # GET /admin/orders.json
  def index
    @orders = Order.all
  end

  # GET /admin/orders/1
  # GET /admin/orders/1.json
  def show
  end

  # PATCH/PUT /admin/orders/1
  # PATCH/PUT /admin/orders/1.json
  def update
    @order_product = OrderProduct.find(params[:id])

    respond_to do |format|
      if @order_product.update_attribute(:status, order_params[:status])
        format.html { redirect_to admin_orders_url, notice: 'Order product was successfully updated.' }
      else
        format.html { render :show }
      end
    end
  end

  # DELETE /admin/categories/1
  # DELETE /admin/categories/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order_product).permit(:status)
  end
end
