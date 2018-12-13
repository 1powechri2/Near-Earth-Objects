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


        expect(neos.first[:magnitude]).to be > neos[1][:magnitude]
        expect(neos.first[:magnitude]).to be > neos.last[:magnitude]
      end
    end
    it 'will sort neos from highest speed to lowest' do
      VCR.use_cassette("neos") do
        start_date = '2018-12-6'
        end_date = '2018-12-12'

        get "/api/v1/neo?start_date=#{start_date}&end_date=#{end_date}&sort=speed"

        expect(response.status).to eq 200

        neos = JSON.parse(response.body, symbolize_names: true)

        expect(neos.first[:speed]).to be > neos[1][:speed]
        expect(neos.first[:speed]).to be > neos.last[:speed]
      end
    end
    it 'will sort neos from largest diameter to smallest' do
      VCR.use_cassette("neos") do
        start_date = '2018-12-6'
        end_date = '2018-12-12'

        get "/api/v1/neo?start_date=#{start_date}&end_date=#{end_date}&sort=diameter"

        expect(response.status).to eq 200

        neos = JSON.parse(response.body, symbolize_names: true)

        expect(neos.first[:diameter][:estimated_diameter_min]).to be > neos[1][:diameter][:estimated_diameter_min]
        expect(neos.first[:diameter][:estimated_diameter_min]).to be > neos.last[:diameter][:estimated_diameter_min]
      end
    end
    it 'will sort neos from closest miss distance to furthest' do
      VCR.use_cassette("neos") do
        start_date = '2018-12-6'
        end_date = '2018-12-12'

        get "/api/v1/neo?start_date=#{start_date}&end_date=#{end_date}&sort=miss_distance"

        expect(response.status).to eq 200

        neos = JSON.parse(response.body, symbolize_names: true)

        expect(neos.first[:miss_distance]).to be < neos[1][:miss_distance]
        expect(neos.first[:miss_distance]).to be < neos.last[:miss_distance]
      end
    end
  end
end
