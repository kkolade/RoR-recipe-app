class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show edit update destroy]

  # GET /inventories
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1
  def show 
    set_inventory
  end

  # GET /inventories/new
  def new
    @inventory = current_user.inventories.build
  end

  # POST /inventories
  def create
    @inventory = current_user.inventories.build(inventory_params)

    if @inventory.save
      redirect_to @inventory, notice: 'Inventory was successfully created.' 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # DELETE /inventories/1
  def destroy
    set_inventory

    if @inventory.user == current_user
      @inventory.destroy
      redirect_to inventories_url, notice: 'Inventory was successfully destroyed.'
    else
      redirect_to @inventory, alert: 'You are not authorized to delete this inventory.'
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
