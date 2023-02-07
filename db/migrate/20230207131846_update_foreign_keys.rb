class UpdateForeignKeys < ActiveRecord::Migration[6.0]
  def change
	remove_reference :recipes, :users, index: true
	remove_reference :ingredients, :recipes, index: true
	remove_reference :procedures, :recipes, index: true

	add_reference :recipes, :user, index: true
	add_reference :ingredients, :recipe, index: true
	add_reference :procedures, :recipe, index: true
  end
end
