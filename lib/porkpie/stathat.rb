require 'net/http'
require 'uri'

module Porkpie
  module StatHat

    def self.endpoint
      'http://api.stathat.com/ez'
    end

    class Request
      attr_reader :params

      def initialize params = {}
        @params = params
      end

      def perform client = Net::HTTP
        client.post_form endpoint_uri, params
      end

      def endpoint_uri
        URI Porkpie::StatHat.endpoint
      end

    end

    class Response

      attr_reader :http_response

      def initialize http_response
        @http_response = http_response
      end

      def valid?
        http_response.code == '200'
      end

    end

  end
end
