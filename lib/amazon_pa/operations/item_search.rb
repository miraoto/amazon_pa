module AmazonPa
  module Operations
    class ItemSearch
      def self.request(keywords)
        url = AmazonPa::Api.url(:item_search) + '&'
        query_strings = []
        query_strings << "Operation=#{self.name.split('::').last}"
        query_strings << "Keywords=#{CGI.escape(keywords)}"
        query_strings << "ResponseGroup=Medium"
        url += query_strings.join('&')
        p url
        p res = Net::HTTP.get_response(URI::parse(url))
        p res.body
      end
    end
  end
end
