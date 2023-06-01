require 'net/http'
require 'json' # Add this line to import the JSON library

class GetRequester
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def get_response_body
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body if response.is_a?(Net::HTTPSuccess)
  end

  def parse_json
    json_body = get_response_body
    JSON.parse(json_body) if json_body
  end
end
