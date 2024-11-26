require 'rails_helper'

RSpec.describe ETransportation do
  describe 'validations' do
    it 'validates type inclusion' do
      transportation = ETransportation.new(
        vehicle_type: 'invalid',
        sensor_type: 'GPS',
        owner_id: 1,
        in_zone: true
      )
      expect(transportation).not_to be_valid
    end
  end
end
