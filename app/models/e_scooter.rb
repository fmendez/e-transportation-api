class EScooter < ApplicationRecord
  attr_accessor :lost_sensor

  belongs_to :e_transportation
  validates :lost_sensor, inclusion: { in: [ true, false ] }
end
