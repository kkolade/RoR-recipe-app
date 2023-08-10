require 'rails_helper'

RSpec.feature "Inventories index page", type: :feature do
  let(:user) { create(:user) } 

  before do
    sign_in(user)
  end

  scenario "displays inventories" do
    inventory1 = create(:inventory, user: user)
    visit inventories_path

    expect(page).to have_content(inventory1.name)
    expect(page).to have_link("Remove", href: inventory_path(inventory1))
    expect(page).to have_link("New inventory", href: new_inventory_path)
  end
end
