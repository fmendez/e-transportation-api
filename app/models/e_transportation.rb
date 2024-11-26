class ETransportation < ApplicationRecord
  validates :transportation_type, inclusion: { in: %w[e-Scooter e-Bike] }
  validates :sensor_type, :owner_id, presence: true
  validates :in_zone, inclusion: { in: [ true, false ] }

  scope :outside_zone, -> { where(in_zone: false) }

  def self.outside_zone_count
    outside_zone
      .group(:transportation_type, :sensor_type)
      .count
  end


  def self.outside_zone_count
    all.reject(&:in_zone).group_by { |t| [ t.transportation_type, t.sensor_type ] }
       .transform_values(&:count)
  end
end
