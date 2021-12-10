require 'rails_helper'

describe 'Countries API' do
  context 'GET /api/v1/contries' do
    it 'should get countries' do
      Country.create!(name: 'Brasil', continent: 'América')
      Country.create!(name: 'Marrocos', continent: 'África')

      get '/api/v1/countries'

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.count).to eq(Country.count)
      expect(parsed_body[0]['name']).to eq('Brasil')
      expect(parsed_body[1]['name']).to eq('Marrocos')
    end

    it 'returns no countries' do
      get '/api/v1/countries'

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      parsed_body = JSON.parse(response.body)
      expect(parsed_body).to be_empty
    end
  end
end