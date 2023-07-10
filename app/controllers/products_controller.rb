class ProductsController < ApplicationController
  before_action :find_product, only: [:show]
  def index
    render json: paginate(Product.all)
  end

  def show
    render json: @product, serializer: ProductSerializer
  end

  private

  def find_product
    @product = Product.find_by(code: params[:id])
    return render json: { message: I18n.t('errors.not_found') } unless @product.present?
  end
end
