class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_categories

  # GET all products
  def index
    @products = Product.search { order_by(:sell_counter, :desc) }.results
  end

  # GET sort the product by price
  # plth - price low to high
  # phtl - price high to low
  def search
    if params[:sort].present? && params[:sort]== 'phtl'
      @products = Product.search { order_by(:price, :desc) }.results
    elsif params[:sort].present? && params[:sort]== 'plth'
      @products = Product.search { order_by(:price, :asc) }.results
    else
      @products = Product.search { order_by(:sell_counter, :desc) }.results
    end
  end
end
