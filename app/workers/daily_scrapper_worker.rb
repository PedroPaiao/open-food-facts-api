class DailyScrapperWorker
  include Sidekiq::Worker

  sidekiq_options queue: :default

  def perform
    service = HomeSpider.call({})
    return ErrorReport.create(text: service.error) unless service.success?

    Product.draft.each do |product|
      SpecificSpiderJob.perform_async(product.id.to_s)
    end
  end
end