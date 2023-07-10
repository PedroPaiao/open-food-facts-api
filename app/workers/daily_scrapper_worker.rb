class DailyScrapperWorker
  include Sidekiq::Worker

  sidekiq_options queue: :default, unique: true

  def perform
    service = HomeSpider.call({})
    return ErrorReport.create(text: service.error) unless service.success?

    Product.draft.each do |product|
      SpecificSpiderJob.perform_async(product.code)
    end
  end
end