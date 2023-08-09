class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :measurement_unit, default: 'unit'
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
