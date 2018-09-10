require 'amazon_pa/config'
require 'amazon_pa/api'

RSpec.describe AmazonPa do
  it "has a version number" do
    expect(AmazonPa::VERSION).not_to be nil
  end

  it "does something useful" do
    AmazonPa::Config.configure do |config|
      config.locale = :jp
      config.service_url = AmazonPa::Config.service_url
      config.access_key = ''
      config.associate_tag = ''
    end
    instance = AmazonPa::Api.operator(:item_search)
    instance::request('iphone')
    # expect(false).to eq(true)
  end
end
