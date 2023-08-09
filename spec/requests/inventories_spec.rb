require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  let(:user) { create(:user) } # Assuming there's a User model with FactoryBot
  let(:inventory) { create(:inventory, user: user) } # Assuming there's an Inventory model with FactoryBot

  describe "GET #index" do
    it "assigns all inventories to @inventories" do
      inventories = create_list(:inventory, 3)
      get :index
      expect(assigns(:inventories)).to eq(inventories)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested inventory to @inventory" do
      get :show, params: { id: inventory.id }
      expect(assigns(:inventory)).to eq(inventory)
    end

    it "renders the :show template" do
      get :show, params: { id: inventory.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new inventory to @inventory" do
      get :new
      expect(assigns(:inventory)).to be_a_new(Inventory)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new inventory" do
        expect {
          post :create, params: { inventory: attributes_for(:inventory) }
        }.to change(Inventory, :count).by(1)
      end

      it "redirects to the created inventory" do
        post :create, params: { inventory: attributes_for(:inventory) }
        expect(response).to redirect_to(Inventory.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new inventory" do
        expect {
          post :create, params: { inventory: attributes_for(:inventory, name: nil) }
        }.to_not change(Inventory, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { inventory: attributes_for(:inventory, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested inventory" do
      inventory # Ensure the inventory is created
      expect {
        delete :destroy, params: { id: inventory.id }
      }.to change(Inventory, :count).by(-1)
    end

    it "redirects to the inventories list" do
      delete :destroy, params: { id: inventory.id }
      expect(response).to redirect_to(inventories_url)
    end
  end
end
