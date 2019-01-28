class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_categories

  # GET show a product
  def show
    @product = Product.find(params[:id])
  end

end
