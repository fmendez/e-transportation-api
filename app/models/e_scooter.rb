class EScooter < ApplicationRecord
  belongs_to :e_transportation
  validates :lost_sensor, inclusion: { in: [ true, false ] }
end
