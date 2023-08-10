require 'rails_helper'

RSpec.feature "Inventories index page", type: :feature do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before do
    sign_in(user)
  end

  scenario "displays user's inventories and hides others' inventories" do
    user_inventory = create(:inventory, user: user)
    other_user_inventory = create(:inventory, user: other_user)

    visit inventories_path

    expect(page).to have_content(user_inventory.name)
    expect(page).not_to have_content(other_user_inventory.name)

    within(".inventory-card", text: user_inventory.name) do
      expect(page).to have_link("Remove")
      expect(page).not_to have_button("Remove", disabled: true)
    end

    within(".inventory-card", text: other_user_inventory.name) do
      expect(page).to have_button("Remove", disabled: true)
    end

    expect(page).to have_link("New inventory", href: new_inventory_path)
  end
end
