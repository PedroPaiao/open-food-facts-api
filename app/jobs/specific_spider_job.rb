class SpecificSpiderJob
  include Sidekiq::Job

  def perform(product_code)
    service = ProductSpider.call(product_code:)
    ErrorReport.create(text: service.error) unless service.success?
  end
end