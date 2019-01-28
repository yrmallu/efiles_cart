class MyOrdersController < ApplicationController

  # GET Display all orders of user
  def index
    @orders = current_user.orders
  end

  # GET display order details with ordered products
  def show
    if params[:id].present?
      @order = Order.find(params[:id])
    end
  end
end
