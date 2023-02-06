class AddIngredientsToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :ingredients, :recipes, index:true
  end
end
