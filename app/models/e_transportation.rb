class ETransportation < ApplicationRecord
  # attr_accessor :id, :type, :sensor_type, :owner_id, :in_zone

  validates :vehicle_type, inclusion: { in: %w[e-Scooter e-Bike] }
  validates :sensor_type, :owner_id, presence: true
  validates :in_zone, inclusion: { in: [ true, false ] }

  scope :outside_zone, -> { where(in_zone: false) }

  def self.outside_zone_count
    outside_zone
      .group(:vehicle_type, :sensor_type)
      .count
  end
  def self.create(attributes)
    transportation = new(attributes)
    if transportation.valid?
      STORAGE.add(transportation)
      transportation
    else
      false
    end
  end

  def self.all
    STORAGE.all
  end

  def self.outside_zone_count
    all.reject(&:in_zone).group_by { |t| [ t.vehicle_type, t.sensor_type ] }
       .transform_values(&:count)
  end
end
