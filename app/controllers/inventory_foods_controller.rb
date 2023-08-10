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

  def destroy
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.find(params[:id])
    @inventory_food.destroy
    redirect_to @inventory, notice: 'Inventory food was successfully deleted.'
  end

  private

  def set_inventory
    @inventory = Inventory.find(params[:inventory_id])
  end

  def set_inventory_food
    @inventory_food = InventoryFood.find(params[:id])
  end

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id, :inventory_id)
  end
end
