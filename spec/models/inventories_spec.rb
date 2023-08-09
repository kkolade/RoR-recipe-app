require 'rails_helper'

RSpec.describe Inventories, type: :model do
  # Create a new inventory
  inventory = Inventory.new(name: 'My Inventory')

  # Associate the inventory with a user
  user = User.find_by(id: 1)
  inventory.user = user

  # Validate and save the inventory
  if inventory.valid?
    inventory.save
  else
    puts "Inventory is invalid: #{inventory.errors.full_messages.join(', ')}"
  end
end
