require 'rails_helper'

RSpec.describe 'E-Transportations API', type: :request do
  describe 'POST /api/v1/e_transportations' do
    it 'creates a new e-transportation' do
      post '/api/v1/e_transportations', params: {
        e_transportation: {
          transportation_type: 'e-Scooter',
          sensor_type: 'GPS',
          owner_id: 1,
          in_zone: true
        }
      }
      expect(response).to have_http_status(:created)
    end

    it 'returns unprocessable entity for invalid parameters' do
      post '/api/v1/e_transportations', params: {
        e_transportation: {
          transportation_type: '',
          sensor_type: 'GPS',
          owner_id: 1
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error message for invalid parameters' do
      post '/api/v1/e_transportations', params: {
        e_transportation: {
          transportation_type: 'e-Scooter',
          sensor_type: '',
          owner_id: nil
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to have_key('errors')
    end
  end

  describe 'GET /api/v1/e_transportations' do
    before do
      create(:e_transportation, transportation_type: 'e-Bike')
      create(:e_transportation, transportation_type: 'e-Scooter')
    end

    it 'returns all e-transportations' do
      get '/api/v1/e_transportations'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'GET /api/v1/e_transportations/:id' do
    let(:e_transportation) { create(:e_transportation) }

    it 'returns the requested e-transportation' do
      get "/api/v1/e_transportations/#{e_transportation.id}"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['id']).to eq(e_transportation.id)
    end

    it 'returns not found for non-existent e-transportation' do
      get '/api/v1/e_transportations/999999'

      expect(response).to have_http_status(:not_found)
    end
  end
end
