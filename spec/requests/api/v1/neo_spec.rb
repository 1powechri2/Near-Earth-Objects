require 'rails_helper'

describe 'Near Earth Objects Endpoint' do
  context '/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12' do
    it 'returns a collection of near earth object data' do
      VCR.use_cassette("neos") do
        start_date = '2018-12-6'
        end_date = '2018-12-12'
        get "/api/v1/neo?start_date=#{start_date}&end_date=#{end_date}"

        expect(response.status).to eq 200

        neos = JSON.parse(response.body, symbolize_names: true)

        expect(neos.first).to include(:name)
        expect(neos.first).to include(:magnitude)
        expect(neos.first).to include(:date)
        expect(neos.first).to include(:speed)
        expect(neos.first).to include(:miss_distance)
        expect(neos.first).to include(:hazard)
        expect(neos.first).to include(:sentry_object)
      end
    end
  end
end
