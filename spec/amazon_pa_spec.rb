require 'amazon_pa/api'
require 'amazon_pa/config'
require 'amazon_pa/element'

RSpec.describe AmazonPa do
  before :all do
    AmazonPa::Config.configure do |config|
      config.locale = :jp
      config.service_url = AmazonPa::Config.service_url
      config.access_key = '<!-- Add access key -->'
      config.secret_key = '<!-- Add secret key -->'
      config.associate_tag = '<!-- Add associate tag -->'
    end
  end

  it "has a version number" do
    expect(AmazonPa::VERSION).not_to be nil
  end

  it "operator(:item_search)" do
    instance = AmazonPa::Api.request(:item_search)
    response = instance::request('iPhone')
    expect(response.header.code).to eq "200"
  end

  it "operator(:item_lookup)" do
    instance = AmazonPa::Api.request(:item_lookup)
    response = instance::request('4274065979')
    expect(response.header.code).to eq "200"
    expect(response.body.get_element('Items/Item').get('ASIN')). to eq '4274065979'
  end
end
