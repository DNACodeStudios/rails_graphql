class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.boolean :completed

      t.timestamps
    end
  end
end
