module AmazonPa
  module Operations
    class ItemSearch
      class << self
        def request(keywords, options = {})
          params = request_params(keywords, options)
          url = AmazonPa::Api.url(params)
          LOG.info("Request URL: #{url}")
          res = Net::HTTP.get_response(url)
          LOG.info("API URL: #{res.uri.to_s}")
          res.body = AmazonPa::Element.new(params[:Operation], REXML::Document.new(res.body))
          res
        end

        private

        def request_params(keywords, options)
          {
            Operation: self.name.split('::').last,
            Keywords: keywords,
            ResponseGroup: 'Small',
            Availability: 'Available',
            SearchIndex: 'All',
            ItemPage: '1'
          }.merge(options)
        end
      end
    end
  end
end
