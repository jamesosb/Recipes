class AddTriedToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :tried, :boolean

  end
end
