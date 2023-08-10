FactoryBot.define do
  factory :food do
    name { 'Food Name' }
    measurement_unit { 'grams' }
    price { 10.0 }
  end
end
