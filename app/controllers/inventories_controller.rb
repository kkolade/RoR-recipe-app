class InventoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory, only: %i[show edit update destroy]

  # GET /inventories
  def index
    @inventories = current_user.inventories
  end

  # GET /inventories/1
  def show
    @inventory = current_user.inventories.find(params[:id])
  end

  # GET /inventories/new
  def new
    @inventory = current_user.inventories.build
  end

  # POST /inventories
  def create
    @inventory = current_user.inventories.build(inventory_params)

    if @inventory.save
      redirect_to inventories_url, notice: 'Inventory was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /inventories/1
  def destroy
    @inventory = Inventory.find(params[:id])

    # Delete associated inventory foods
    @inventory.inventory_foods.destroy_all

    # Delete the inventory
    @inventory.destroy

    redirect_to inventories_url, notice: 'Inventory was successfully destroyed.'
  end

  private

  def set_inventory
    @inventory = current_user.inventories.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
