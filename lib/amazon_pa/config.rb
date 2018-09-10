require 'active_support/configurable'

module AmazonPa
  class Config
    include ActiveSupport::Configurable
    config_accessor :access_key, :associate_tag, :locale, :service_url
    config_accessor :service do
      'AWSECommerceService'
    end
    config_accessor :version do
      '2013-08-01'
    end

    SERVICE_URLS = {
      us: 'http://webservices.amazon.com/onca/xml',
      uk: 'http://webservices.amazon.co.uk/onca/xml',
      ca: 'http://webservices.amazon.ca/onca/xml',
      de: 'http://webservices.amazon.de/onca/xml',
      jp: 'http://webservices.amazon.co.jp/onca/xml',
      fr: 'http://webservices.amazon.fr/onca/xml',
      it: 'http://webservices.amazon.it/onca/xml',
      cn: 'http://webservices.amazon.cn/onca/xml',
      es: 'http://webservices.amazon.es/onca/xml',
      in: 'http://webservices.amazon.in/onca/xml',
      br: 'http://webservices.amazon.com.br/onca/xml',
      mx: 'http://webservices.amazon.com.mx/onca/xml',
      au: 'http://webservices.amazon.com.au/onca/xml'
    }

    def self.service_url
      SERVICE_URLS[config.locale]
    end
  end
end
