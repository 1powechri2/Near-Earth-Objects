require 'rails_helper'

describe 'filtering by hazard' do
  context '/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12&filter=hazard' do
    it 'will filter out only hazardous neos' do
      VCR.use_cassette("neos") do
        start_date = '2018-12-6'
        end_date = '2018-12-12'

        get "/api/v1/neo?start_date=#{start_date}&end_date=#{end_date}&filter=hazard"

        expect(response.status).to eq 200

        neos = JSON.parse(response.body, symbolize_names: true)

        expect(neos.first[:hazard]).to eq(true)
        expect(neos.last[:hazard]).to eq(true)
      end
    end
  end
end
