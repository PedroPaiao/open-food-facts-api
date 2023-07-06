class ProductSerializer < ActiveModel::Serializer
  attributes :id, :code, :barcode, :imported_t, :url, :product_name, :quantity, :categories,
             :packaging, :brands, :image_url
end