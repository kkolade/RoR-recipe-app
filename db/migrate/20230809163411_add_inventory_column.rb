class AddInventoryColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :description, :string, default: ''
  end
end
