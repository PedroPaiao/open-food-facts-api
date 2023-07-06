class ProductsController < ApplicationController
  def index
    render json: paginate(Product.all)
  end
end
