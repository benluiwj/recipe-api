class AddUsernameToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :users, column: :user_name
  end
end
