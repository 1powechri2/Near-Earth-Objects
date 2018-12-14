require 'rails_helper'

describe 'Bad requests return status errors and json error messages' do
  context '/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12&filter=stuff&sort=thingy' do
    it 'returns status 400' do
      VCR.use_cassette("neos") do
        get '/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12&filter=stuff&sort=thingy'

        expect(response.status).to eq(400)

        error = JSON.parse(response.body, symbolize_names: true)

        expect(error[:error]).to eq('filter query must = hazard')
      end
    end
  end
  context '/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12&filter=hazard&sort=thingy' do
    it 'returns status 400' do
      VCR.use_cassette("neos") do
        get '/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12&hazard=stuff&sort=thingy'

        expect(response.status).to eq(400)

        error = JSON.parse(response.body, symbolize_names: true)

        expect(error[:error]).to eq('bad sort query')
      end
    end
  end
end
