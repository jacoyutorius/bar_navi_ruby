require "faraday"
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
    def get preference=nil

      raise "preference is required" if preference.nil?

      pattern = "0"
      pref = "22"
      url = "#{BASE_URL}?key=#{@api_key}&pattern=#{pattern}&pref=#{pref}&url=#{@call_url}&address=ぬい屋ビル"
      url = URI.encode(url)

      response = connection(url).get
      body = response.body
      hash = Hash.from_xml(body.force_encoding("UTF-8"))
      raise hash["error"] if hash.has_key? "error"
      hash
    end

    private
    def connection url
      @connection ||= Faraday.new(url: url) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
