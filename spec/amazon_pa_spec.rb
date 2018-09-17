require 'amazon_pa/config'
require 'amazon_pa/api'
require 'pry'

RSpec.describe AmazonPa do
  before :all do
    AmazonPa::Config.configure do |config|
      config.locale = :jp
      config.service_url = AmazonPa::Config.service_url
      config.access_key = ''
      config.secret_key = ''
      config.associate_tag = ''
    end
  end

  it "has a version number" do
    expect(AmazonPa::VERSION).not_to be nil
  end

  it "operator(:item_search)" do
    instance = AmazonPa::Api.request(:item_search)
    response = instance::request('Shirt')
    expect(response.header.code).to eq "200"
    # expect(false).to eq(true)
  end
end
