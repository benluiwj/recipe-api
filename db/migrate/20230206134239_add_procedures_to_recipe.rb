class AddProceduresToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :procedures, :recipes, index:true
  end
end
