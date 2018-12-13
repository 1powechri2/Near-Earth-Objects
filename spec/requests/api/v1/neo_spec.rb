require 'rails_helper'

describe 'Near Earth Objects Endpoint' do
  context '/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12' do
    it 'returns a collection of near earth object data' do
      VCR.use_cassette("neos") do
        start_date = '2018-12-6'
        end_date = '2018-12-12'
        get "/api/v1/neo?start_date=#{start_date}&end_date=#{end_date}"

        expect(response.status).to eq 200

        neos = JSON.parse(response.body)

        expect(neos.first.class).to eq(NearEarthObject)
      end
    end
  end
end
