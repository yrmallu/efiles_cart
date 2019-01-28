class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_category, only: [:show]
  before_action :set_categories, only: [:show]

  # GET show products category wise
  def show
    @category = Category.find(params[:id])
    @products = Product.search { with(:category_id, params[:id]) }.results
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

end
