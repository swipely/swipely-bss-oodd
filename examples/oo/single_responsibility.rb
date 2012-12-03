require 'rubygems'
require 'json'
require 'net/https'

class BostonStores
  def self.get(pretty_url)
    url = 'https://swipely.com/directories/boston.json'
    http = Net::HTTP.new(URI.parse(url).host, 443)
    http.use_ssl = true
    req = Net::HTTP::Get.new(url)
    response = http.request(req)
    json = response.body

    store_arr = JSON.parse(json)
    store_arr.detect { |store| store['pretty_url'] == pretty_url }
  end
end
