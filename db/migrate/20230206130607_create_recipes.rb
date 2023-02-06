class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :image
      t.string :name
      t.string :source_url
      t.string :category
      t.integer :serving_size
      t.integer :prep_time
      t.integer :cook_time
      t.string :yield
      t.string :notes

      t.timestamps
    end
  end
end
