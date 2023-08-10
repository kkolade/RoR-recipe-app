FactoryBot.define do
  factory :recipe do
    name { 'Pasta' }
    description { 'Famous italian dish' }
    preparation_time { 2 }
    cooking_time { 20 }
    is_public { true }
    association :user, factory: :user
  end
end
