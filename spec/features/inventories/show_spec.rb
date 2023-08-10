require 'rails_helper'

RSpec.feature "Inventory show page", type: :feature do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, user: user) }
  let(:food) { create(:food) }
  let!(:inventory_food) { create(:inventory_food, inventory: inventory, food: food) }

  before do
    sign_in(user)
  end

  scenario "displays inventory foods and allows deletion" do
    visit inventory_path(inventory)

    expect(page).to have_content(inventory.name)
    expect(page).to have_content(food.name)
    expect(page).to have_content(inventory_food.quantity)
    expect(page).to have_link("Delete", href: inventory_food_path(inventory_food))

    within("tbody") do
      expect(page).to have_selector("tr", count: 1)
    end

    click_link("Delete", href: inventory_food_path(inventory_food))
    page.driver.browser.switch_to.alert.accept

    within("tbody") do
      expect(page).to have_no_content(food.name)
    end
  end

  scenario "navigates back to inventories list" do
    visit inventory_path(inventory)

    click_link("Back to inventories")

    expect(current_path).to eq(inventories_path)
  end

  scenario "navigates to add new food page" do
    visit inventory_path(inventory)

    click_link("Add New Food")

    expect(current_path).to eq(new_inventory_food_path(inventory))
  end
end
