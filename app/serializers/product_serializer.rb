class ProductSerializer < ActiveModel::Serializer
  attributes :code, :barcode, :imported_t, :url, :product_name, :quantity, :categories,
             :packaging, :brands, :image_url, :status
end