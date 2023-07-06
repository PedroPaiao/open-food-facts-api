require 'base64'
require 'json'
require 'httparty'

class BaseClient
  HEADER = { 'Content-Type': 'application/json' }.freeze

  def initialize(base_url)
    @base_url = base_url
  end

  def get(endpoint: nil, query: nil)
    log("\n========== Start GET request ==========\n")
    log("Request to ===> #{@base_url}#{endpoint}\n")

    response = handle_response(HTTParty.get("#{@base_url}#{endpoint}", query:))
    log("========================================\n")

    response
  end

  private

  def handle_response(response)
    log("Response with status code #{response.response.code} #{response.response.message}\n")
    html = response.body
    object_response = response_object_template(response.success?, html)

    Responder.new(object_response)
  end

  def log(message)
    Rails.logger.info(message)
  end

  def response_object_template(success, result)
    { success:, result: }
  end
end
