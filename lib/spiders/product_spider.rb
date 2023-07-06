class ProductSpider < BaseSpider::OpenFoodFactsApi
  needs :product

  steps :fetch_html,
        :fetch_products,
        :persist_product

  def call
    process_steps
  end

  private

  def fetch_html
    response = @client.product(product.url)

    return fail({ message: 'Fail to load html on specific product page' }) unless response.success

    @html = response.result
  end

  def fetch_products
    # name = @html.css('.card-section').css('h2')[1].text.strip
    # TODO: Verify what is code field here
    @update_params = {
      barcode: @html.css('#barcode').text.strip,
      brands: @html.css('#field_brands').css('.field_value').text,
      quantity: @html.css('#field_quantity').css('.field_value').text,
      packaging: @html.css('p#field_packaging').css('.field_value').text.strip,
      categories: @html.css('p#field_categories').css('.field_value').text.strip,
      imported_t: Time.now
    }
  end

  def persist_product
    product.update(@update_params)
  rescue Mongo::Error => e
    fail(e)
  end
end