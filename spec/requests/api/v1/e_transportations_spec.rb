require 'rails_helper'

RSpec.describe 'E-Transportations API', type: :request do
  describe 'POST /api/v1/e_transportations' do
    it 'creates a new e-transportation' do
      post '/api/v1/e_transportations', params: {
        e_transportation: {
          vehicle_type: 'e-Scooter',
          sensor_type: 'GPS',
          owner_id: 1,
          in_zone: true
        }
      }
      expect(response).to have_http_status(:created)
    end
  end
end
