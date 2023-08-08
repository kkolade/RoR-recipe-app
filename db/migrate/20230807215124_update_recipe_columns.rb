class UpdateRecipeColumns < ActiveRecord::Migration[7.0]
  def change
    # Add new columns for the preparation_time_in_minutes and cooking_time_in_minutes
    add_column :recipes, :preparation_time_in_minutes, :integer
    add_column :recipes, :cooking_time_in_minutes, :integer

    # Convert the existing time values to minutes and store them in the new columns
    Recipe.all.each do |recipe|
      recipe.update(preparation_time_in_minutes: convert_time_to_minutes(recipe.preparation_time),
                    cooking_time_in_minutes: convert_time_to_minutes(recipe.cooking_time))
    end

    # Remove the old time columns
    remove_column :recipes, :preparation_time
    remove_column :recipes, :cooking_time

    # Rename the new columns to the original column names
    rename_column :recipes, :preparation_time_in_minutes, :preparation_time
    rename_column :recipes, :cooking_time_in_minutes, :cooking_time
  end

  private

  def convert_time_to_minutes(time)
    # Parse the time string and calculate the total minutes
    return 0 unless time

    hours, minutes = time.split(':').map(&:to_i)
    hours * 60 + minutes
  end
end
