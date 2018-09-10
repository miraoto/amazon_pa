require 'net/http'
require 'nokogiri'
require 'openssl'
require 'cgi'
require 'active_support/inflector'

module AmazonPa
  class Api
    def self.operator(operator_name)
      require "amazon_pa/operations/#{operator_name.to_s}"
      operator_instance = "AmazonPa::Operations::#{operator_name.to_s.camelize}".constantize
      operator_instance
    end

    def self.url(operation)
      url = "#{AmazonPa::Config.config.service_url}?"
      query_strings = []
      query_strings << "Service=#{AmazonPa::Config.config.service}"
      query_strings << "Version=#{AmazonPa::Config.config.version}"
      query_strings << "AWSAccessKeyId=#{AmazonPa::Config.config.access_key}"
      query_strings << "AssociateTag=#{AmazonPa::Config.config.associate_tag}"
      query_strings << "Timestamp=#{Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")}"
      query_strings << "Signature="
      "#{AmazonPa::Config.config.service_url}?" + query_strings.join('&')
    end
  end
end
