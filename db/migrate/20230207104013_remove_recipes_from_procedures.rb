class RemoveRecipesFromProcedures < ActiveRecord::Migration[6.0]
  def change
    remove_column :procedures, :recipes_id, :integer
  end
end
