# spec/support/factory_bot.rb

# Load FactoryBot methods
require 'factory_bot'

# Define factories
FactoryBot.define do
  factory :user do
    # Define attributes for the user factory
    name { 'John Doe' }
    email { 'john@example.com' }
    password { 'password123' }
    # Add more attributes as needed
  end

  factory :inventory do
    # Define attributes for the inventory factory
    name { 'Sample Inventory' }
    # Add more attributes as needed
  end

  # Define other factories here

  # You can also define factory traits for variations
  trait :admin do
    role { 'admin' }
  end
end

# Configure FactoryBot to use these definitions
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end
