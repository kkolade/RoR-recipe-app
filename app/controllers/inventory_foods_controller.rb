class InventoryFoodsController < ApplicationController
  before_action :set_inventory

  def new
    @inventory_food = InventoryFood.new
  end

  def create
    @inventory_food = @inventory.inventory_foods.build(inventory_food_params)

    if @inventory_food.save
      redirect_to inventory_path(@inventory), notice: 'Food was successfully added to the inventory.'
    else
      render 'inventories/show'
    end
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id, :inventory_id)
  end
end
