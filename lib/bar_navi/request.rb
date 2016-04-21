require "faraday"
require "faraday_middleware"
require 'active_support'
require 'active_support/core_ext'
require "uri"
require "bar_navi/errors"

module BarNavi
  BASE_URL = "http://webapi.suntory.co.jp"


  class Request
    def initialize api_key, call_url
      @api_key = api_key
      @call_url = call_url
      @connection = nil
    end

    def get preference:nil, pattern:0, logger: false, latitude: nil, longitude: nil, address: nil

      condition_hash = search_condition(preference, pattern, latitude, longitude, address)
      url = BASE_URL
      url = URI.encode(url)

      response = connection(url, logger).get("/barnavi/v2/shops", condition_hash)
      hash = response.body
      raise Errors::APIError.new(hash["error"]) if hash.has_key? "error"

      hash
    end

    private
    def connection url, logger
      @connection ||= Faraday.new(url: url) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger if logger
        faraday.response :xml,  :content_type => /\bxml$/
        faraday.adapter Faraday.default_adapter
      end
    end

    def search_condition preference, pattern, latitude, longitude, address
      raise Errors::PreferenceNotFound if preference.nil?

      base_hash = {
        key: @api_key,
        url: @call_url,
        pref: preference,
        pattern: pattern
      }

      if pattern == 1
        raise Errors::LatitudeLongitudeNotFound unless latitude.present?
        raise Errors::LatitudeLongitudeNotFound unless longitude.present?

        base_hash[:lat] = latitude
        base_hash[:lng] = longitude
      else
        base_hash[:address] = address
      end

      base_hash
    end
  end
end
