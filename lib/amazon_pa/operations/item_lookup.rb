require 'pry'
module AmazonPa
  module Operations
    class ItemLookup
      class << self
        def request(item_id, options = {})
          params = request_params(item_id, options)
          url = AmazonPa::Api.url(params)
          LOG.info("Request URL: #{url}")
          res = Net::HTTP.get_response(url)
          LOG.info("API URL: #{res.uri.to_s}")
          res.body = AmazonPa::Element.new(params[:Operation], REXML::Document.new(res.body))
          res
        end

        private

        def request_params(item_id, options)
          {
            Operation: self.name.split('::').last,
            Condition: 'All',
            ItemId: item_id,
            ResponseGroup: 'Medium'
          }.merge(options)
        end
      end
    end
  end
end
