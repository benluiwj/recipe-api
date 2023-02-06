class CreateProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :procedures do |t|
      t.integer :step_num
      t.string :procedure

      t.timestamps
    end
  end
end
