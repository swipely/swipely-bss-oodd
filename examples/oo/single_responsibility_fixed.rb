require 'rubygems'
require 'json'
require 'net/https'

class Stores
  def initialize(requester)
    @requester = requester
  end

  def [](pretty_url)
    json = @requester.request
    store_arr = JSON.parse(json)
    store_arr.detect { |store| store['pretty_url'] == pretty_url }
  end
end


class StoreGetter
  def initialize(source_url)
    @url = source_url
  end

  def request
    http = Net::HTTP.new(URI.parse(@url).host, 443)
    http.use_ssl = true
    req = Net::HTTP::Get.new(@url)
    response = http.request(req)
    
    response.body
  end
end


# Using it:
boston_stores = Stores.new(StoreGetter.new('https://swipely.com/directories/boston.json'))
boston_stores['porters-bar-and-grill-boston']

pvd_stores = Stores.new(StoreGetter.new('https://swipely.com/directories/providence.json'))
pvd_stores['the-duck-and-bunny']
