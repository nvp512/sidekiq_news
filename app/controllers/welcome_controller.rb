class WelcomeController < ApplicationController
  def index
    url = 'https://api.bitfinex.com/v2/tickers?symbols=tBTCUSD'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    res = JSON.parse(response)
    price = res.first[7]
    binding.pry
  end
end
