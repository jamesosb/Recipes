class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :source
      t.integer :rating

      t.timestamps
    end
  end
end