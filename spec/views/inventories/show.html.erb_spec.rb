require 'rails_helper'

RSpec.describe "inventory_foods/index", type: :view do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, user: user) }
  let(:food) { create(:food) }
  let!(:inventory_food) { create(:inventory_food, inventory: inventory, food: food) }

  before do
    assign(:inventory, inventory)
    assign(:inventory_foods, [inventory_food])
    allow(view).to receive(:current_user).and_return(user)
    render
  end

  it "displays inventory information" do
    expect(rendered).to have_content(inventory.name)
    expect(rendered).to have_content(food.name)
    expect(rendered).to have_content(inventory_food.quantity)
    expect(rendered).to have_link("Delete", href: inventory_food_path(inventory_food))
    expect(rendered).to have_link("Back to inventories", href: inventories_path)
  end

  it "renders the 'Add New Food' link" do
    expect(rendered).to have_link("Add New Food", href: new_inventory_food_path(inventory))
  end
end
