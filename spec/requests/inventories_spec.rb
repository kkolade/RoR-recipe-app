require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) { { name: 'Test Inventory', description: 'Test Description' } }
  let(:invalid_attributes) { { name: '', description: 'Test Description' } }
  let(:valid_session) { {} }

  before do
    sign_in(user) 
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      inventory = user.inventories.create! valid_attributes
      get :show, params: { id: inventory.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new inventory" do
        expect {
          post :create, params: { inventory: valid_attributes }, session: valid_session
        }.to change(Inventory, :count).by(1)
      end

      it "redirects to the inventories list" do
        post :create, params: { inventory: valid_attributes }, session: valid_session
        expect(response).to redirect_to(inventories_url)
      end
    end

    context "with invalid params" do
      it "does not create a new inventory" do
        expect {
          post :create, params: { inventory: invalid_attributes }, session: valid_session
        }.to_not change(Inventory, :count)
      end

      it "renders the :new template" do
        post :create, params: { inventory: invalid_attributes }, session: valid_session
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested inventory" do
      inventory = user.inventories.create! valid_attributes
      expect {
        delete :destroy, params: { id: inventory.to_param }, session: valid_session
      }.to change(Inventory, :count).by(-1)
    end

    it "redirects to the inventories list" do
      inventory = user.inventories.create! valid_attributes
      delete :destroy, params: { id: inventory.to_param }, session: valid_session
      expect(response).to redirect_to(inventories_url)
    end

    it "does not allow users to delete other users' inventories" do
      other_user = create(:user)
      inventory = other_user.inventories.create! valid_attributes
      delete :destroy, params: { id: inventory.to_param }, session: valid_session
      expect(response).to redirect_to(inventory)
      expect(flash[:alert]).to eq('You are not authorized to delete this inventory.')
    end
  end
end
