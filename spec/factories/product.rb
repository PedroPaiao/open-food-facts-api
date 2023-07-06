FactoryBot.define do
  factory(:product) do
    code { 0 }
    barcode { Faker::Internet.email }
    imported_t { Faker::Internet.email }
    url { Faker::Internet.email }
    product_name { Faker::Internet.email }
    quantity { Faker::Internet.email }
    categories { Faker::Internet.email }
    packaging { Faker::Internet.email }
    brands { Faker::Internet.email }
    image_url { Faker::Internet.email }
  end
end