module BarNavi
  module Errors
    class PreferenceNotFound < StandardError;end
    class LatitudeLongitudeNotFound < StandardError;end
    class APIError < StandardError
      attr_reader :errors
      def initialize errors
        @errors = errors
      end
    end
  end
end
