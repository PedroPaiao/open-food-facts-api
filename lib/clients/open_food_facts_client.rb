class OpenFoodFactsClient < BaseClient
  URL = 'https://world.openfoodfacts.org'.freeze

  def initialize
    super(URL)
  end

  def home_page
    get
  end

  def product(url)
    get(endpoint: url)
  end
end
