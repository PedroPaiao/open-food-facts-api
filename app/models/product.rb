class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Enumerize

  enumerize :status, in: %i[draft imported], default: :draft, scope: :shallow

  default_scope -> { order(imported_t: :asc) }

  field :code, type: String
  field :barcode, type: String
  field :imported_t, type: DateTime
  field :url, type: String
  field :product_name, type: String
  field :quantity, type: String
  field :categories, type: String
  field :packaging, type: String
  field :brands, type: String
  field :image_url, type: String
end
