module AmazonPa
  module Operations
    class ItemSearch
      class << self
        def request(keywords)
          url = AmazonPa::Api.url(request_params(keywords))
          # TODO: log
          res = Net::HTTP.get_response(url)
          # TODO: log
          p res.body
          res
        end

        private

        def request_params(keywords)
          {
            Operation: self.name.split('::').last,
            Keywords: keywords,
            ResponseGroup: 'Medium',
            Availability: 'Available',
            MerchantId: 'All'
          }
        end
      end
    end
  end
end
