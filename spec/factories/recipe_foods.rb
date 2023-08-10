FactoryBot.define do
  factory :recipe_food do
    association :recipe
    association :food
    quantity { 1 }
  end
end
