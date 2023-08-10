require 'rails_helper'

RSpec.describe 'inventories/index', type: :view do
  let(:user) { create(:user) }
  let(:inventory1) { create(:inventory, user:) }
  let(:inventory2) { create(:inventory, user: create(:user)) }

  before do
    assign(:inventories, [inventory1, inventory2])
    allow(view).to receive(:current_user).and_return(user)
    render
  end

  it 'displays inventories' do
    expect(rendered).to have_content(inventory1.name)
    expect(rendered).to have_selector('.inventory-card', count: 2)
    expect(rendered).to have_no_link('Remove', href: inventory_path(inventory1))
    expect(rendered).to have_link('New inventory', href: new_inventory_path)
  end

  it 'renders Remove button correctly for owned inventory' do
    expect(rendered).to have_button('Remove', count: 1, disabled: false)
  end

  it 'renders Remove button correctly for non-owned inventory' do
    expect(rendered).to have_button('Remove', count: 1, disabled: true)
  end
end
