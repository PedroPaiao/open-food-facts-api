class HomeSpider < BaseSpider::OpenFoodFactsApi
  steps :fetch_html,
        :fetch_products,
        :persist_draft_products

  def call
    process_steps
  end

  private

  def fetch_html
    response = @client.home_page

    return fail(I18n.t('spiders.home_spider.errors.fetch_html')) unless response.success

    @html = response.result
  end

  def fetch_products
    @products = []
    products_container = @html.css('.large-12.columns').first.css('li')

    products_container[0..99].each do |product|
      next if product.css('a').blank? || product.css('a').first.attribute('title').blank?

      params = {
        url: product.css('a').first.attribute('href').value,
        product_name: product.css('a').first.attribute('title').value,
        image_url: product.css('img').first.attribute('src').value
      }
      @products << params
    end
  end

  def persist_draft_products
    Product.with_session do |s|
      s.start_transaction

      @products.each do |product|
        Product.find_or_create_by(product)
      end

      s.commit_transaction
    end
  rescue Mongo::Error => e
    fail(e)
  end
end