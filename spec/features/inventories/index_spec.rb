require 'rails_helper'

RSpec.describe 'Inventories index page', type: :feature do
  include Devise::Test::IntegrationHelpers

  it "displays user's inventories and hides others' inventories" do
    user = create(:user) # Create a user
    sign_in(user) # Sign in the user

    create(:inventory, name: "User's Inventory", user:)
    other_user = create(:user)
    create(:inventory, name: "Other User's Inventory", user: other_user)

    visit inventories_path

    expect(page).to have_content("User's Inventory")
    expect(page).not_to have_content("Other User's Inventory")
  end

  it "renders Remove button for user's inventory" do
    user = create(:user)
    sign_in(user)
    create(:inventory, name: "User's Inventory", user:)

    visit inventories_path

    within '.inventory-card', text: "User's Inventory" do
      expect(page).to have_button('Remove')
      expect(page).not_to have_button('Remove', disabled: true)
    end
  end

  it "renders 'New inventory' link" do
    user = create(:user)
    sign_in(user)

    visit inventories_path

    expect(page).to have_link('New inventory', href: new_inventory_path)
  end
end
