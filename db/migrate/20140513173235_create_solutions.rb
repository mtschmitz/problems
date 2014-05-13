class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :user_id
      t.integer :problem_id
      t.string :name
      t.text :plan
      t.text :result
      t.boolean :attempted

      t.timestamps
    end
    add_index :solutions, :problem_id, unique: true
    
  end
end
