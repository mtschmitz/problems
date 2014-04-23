class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :problems, :name, unique: true
  end
end
