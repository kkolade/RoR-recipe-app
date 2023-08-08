class ChangeRecipesColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipes, :public, :is_public
    change_column :recipes, :is_public, :boolean, default: false
  end
end
