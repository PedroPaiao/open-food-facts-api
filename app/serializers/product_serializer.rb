class ProductSerializer < ActiveModel::Serializer
  attributes :code, :barcode, :imported_t, :url, :product_name, :quantity, :categories,
             :packaging, :brands, :image_url

  def code
    object._id.to_s
  end
end