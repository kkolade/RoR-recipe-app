require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    inventory = Inventory.new(name: 'Test Inventory', user:)
    expect(inventory).to be_valid
  end

  it 'is not valid without a name' do
    inventory = Inventory.new(user:)
    expect(inventory).to_not be_valid
    expect(inventory.errors[:name]).to include("can't be blank")
  end

  it 'belongs to a user' do
    association = Inventory.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many inventory_foods' do
    association = Inventory.reflect_on_association(:inventory_foods)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many foods through inventory_foods' do
    association = Inventory.reflect_on_association(:foods)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:through]).to eq(:inventory_foods)
  end

  it 'has an attribute description of type text' do
    inventory = create(:inventory, user:) # Associate the user with the inventory

    description_column = inventory.class.column_for_attribute('description')
    expect(description_column.type).to eq(:text)
  end
end
