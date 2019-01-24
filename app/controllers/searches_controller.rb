class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = 'VM0I2M0DYQHGS22LHFPDYPDKH5TCBJCKW2BWRO5OIPAAEUYJ'
      req.params['client_secret'] = 'UF4ZIY0H2J4RHQ1RPHXXADEA0QWOOW24AXH2YUFUC5OPJU0R'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
      req.params['v'] = '20160201'
    end

    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
