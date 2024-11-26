require 'rails_helper'

RSpec.describe ETransportation do
  let(:valid_attributes) do
    {
      transportation_type: 'e-Scooter',
      sensor_type: 'GPS',
      owner_id: 1,
      in_zone: true
    }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      transportation = ETransportation.new(valid_attributes)
      expect(transportation).to be_valid
    end

    it 'validates type inclusion' do
      transportation = ETransportation.new(valid_attributes.merge(transportation_type: 'invalid'))
      expect(transportation).not_to be_valid
      expect(transportation.errors[:transportation_type]).to include('is not included in the list')
    end

    it 'validates presence of transportation_type' do
      transportation = ETransportation.new(valid_attributes.merge(transportation_type: nil))
      expect(transportation).not_to be_valid
    end

    it 'validates presence of sensor_type' do
      transportation = ETransportation.new(valid_attributes.merge(sensor_type: nil))
      expect(transportation).not_to be_valid
      expect(transportation.errors[:sensor_type]).to include("can't be blank")
    end

    it 'validates presence of owner_id' do
      transportation = ETransportation.new(valid_attributes.merge(owner_id: nil))
      expect(transportation).not_to be_valid
      expect(transportation.errors[:owner_id]).to include("can't be blank")
    end
  end

  describe 'scopes' do
    before do
      @in_zone = ETransportation.create!(valid_attributes)
      @out_zone = ETransportation.create!(valid_attributes.merge(in_zone: false))
    end
  end
end
