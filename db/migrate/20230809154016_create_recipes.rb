class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :description, default: ''
      t.integer :preparation_time, default: 0
      t.integer :cooking_time, default: 0
      t.boolean :is_public, default: false
      t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
