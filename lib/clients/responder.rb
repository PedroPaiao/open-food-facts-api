class Responder
  attr_reader :result, :success

  def initialize(response)
    @success = response[:success]
    @result = Nokogiri::HTML(response[:result]) if @success
    @result ||= response[:result]
  end
end
