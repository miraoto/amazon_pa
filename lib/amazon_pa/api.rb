require 'net/http'
require 'nokogiri'
require 'openssl'
require 'cgi'
require 'active_support/inflector'

module AmazonPa
  class Api
    class << self
      def request(operator_name)
        require "amazon_pa/operations/#{operator_name.to_s}"
        operator = "AmazonPa::Operations::#{operator_name.to_s.camelize}".constantize
        operator
      end

      def url(params)
        signatured_url(unsigned_url(params))
      end

      private

      def query_strings(params)
        request_params.merge(params).sort.map {|k,v| "#{k}=#{CGI.escape(v).gsub('+', '%20')}"}
      end

      def unsigned_url(params)
        URI::parse("#{AmazonPa::Config.config.service_url}?" + query_strings(params).join('&'))
      end

      def signatured_url(url)
        signature = OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new("sha256"),
                                         AmazonPa::Config.config.secret_key,
                                         "GET\n#{url.host}\n#{url.path}\n#{url.query}"
                                        )
        signature = [signature].pack("m").chomp
        signature = URI.escape(signature, Regexp.new("[+=]"))
        URI::parse("#{url}&Signature=#{signature}")
      end

      def request_params
        {
          Service: AmazonPa::Config.config.service,
          Version: AmazonPa::Config.config.version,
          AWSAccessKeyId: AmazonPa::Config.config.access_key,
          AssociateTag: AmazonPa::Config.config.associate_tag,
          Timestamp: Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
        }
      end
    end
  end
end
