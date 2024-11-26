FactoryBot.define do
  factory :e_transportation do
    transportation_type { 'e-Scooter' }
    sensor_type { 'GPS' }
    owner_id { 1 }
    in_zone { false }
  end
end
