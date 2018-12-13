require 'rails_helper'

describe 'sorting by magnitude' do
  context '/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12&sort=magnitude' do
    it 'will sort neos from highest magnitude to lowest' do
      VCR.use_cassette("neos") do
        start_date = '2018-12-6'
        end_date = '2018-12-12'
        get "/api/v1/neo?start_date=#{start_date}&end_date=#{end_date}&sort=magnitude"

        expect(response.status).to eq 200

        neos = JSON.parse(response.body, symbolize_names: true)
        expect(neos.first[:magnitude]).to eq(28.175)
      end
    end
  end
end
