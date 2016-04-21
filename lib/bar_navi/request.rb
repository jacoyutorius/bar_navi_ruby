require "faraday"
require "faraday_middleware"
require 'active_support'
require 'active_support/core_ext'
require "uri"

module BarNavi
  BASE_URL = "http://webapi.suntory.co.jp/barnavi/v2/shops"

  class Request
    def initialize api_key, call_url
      @api_key = api_key
      @call_url = call_url
      @connection = nil
    end
    def get preference:nil, pattern:0, &args
      raise "preference is required" if preference.nil?

p args
      url = "#{BASE_URL}?key=#{@api_key}&pattern=#{pattern}&pref=#{preference}&url=#{@call_url}&address=ぬい屋ビル"
      url = URI.encode(url)

      response = connection(url).get
      hash = response.body
      raise hash["error"] if hash.has_key? "error"

      hash
    end

    private
    def connection url
      @connection ||= Faraday.new(url: url) do |faraday|
        faraday.request :url_encoded
        # faraday.response :logger
        faraday.response :xml,  :content_type => /\bxml$/
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
