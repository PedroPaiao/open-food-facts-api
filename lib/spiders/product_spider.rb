class ProductSpider < BaseSpider::OpenFoodFactsApi
  needs :product_id

  steps :fetch_product,
        :fetch_html,
        :fetch_products,
        :persist_product

  def call
    process_steps
  end

  private

  def fetch_product
    @product = Product.find(product_id)

    fail(I18n.t('spiders.product_spider.errors.fetch_product')) if @product.blank?
  end

  def fetch_html
    response = @client.product(@product.url)

    return fail(I18n.t('spiders.product_spider.errors.fetch_product_page')) unless response.success

    @html = response.result
  end

  def fetch_products

    @update_params = {
      code: @html.css('#barcode').text.strip,
      barcode: @html.css('#barcode_paragraph').text.strip.split(':').second.strip,
      brands: @html.css('#field_brands').css('.field_value').text,
      quantity: @html.css('#field_quantity').css('.field_value').text,
      packaging: @html.css('p#field_packaging').css('.field_value').text.strip,
      categories: @html.css('p#field_categories').css('.field_value').text.strip,
      imported_t: Time.now,
      status: :imported
    }
  end

  def persist_product
    @product.update_attributes!(@update_params)
  rescue Mongo::Error => e
    fail(e)
  end
end