class SpecificSpiderJob
  include Sidekiq::Job

  def perform(product_id)
    service = ProductSpider.call(product_id:)
    ErrorReport.create(text: service.error) unless service.success?
  rescue StandardError => e
    ErrorReport.create(text: e)
  end
end