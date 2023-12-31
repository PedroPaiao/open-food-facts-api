class ApplicationController < ActionController::API
  include ApiCommonResponses

  def paginate(scope, default_per_page = 20)
    collection = scope.page(params[:page]).per((params[:per_page] || default_per_page).to_i)

    current, total, per_page = collection.current_page, collection.total_pages, collection.limit_value

    serialized = ActiveModel::SerializableResource.new(
      collection,
      each_serializer: ProductSerializer
    ).as_json

    {
      data: serialized,
      pagination: {
        current:,
        previous: (current > 1 ? (current - 1) : nil),
        next: (current == total ? nil : (current + 1)),
        per_page:,
        pages: total,
        count: collection.total_count
      }
    }
  end
end
