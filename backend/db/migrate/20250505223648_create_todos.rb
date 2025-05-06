class CreateTodos < ActiveRecord::Migration[7.2]
  def change
    create_table :todos do |t|
      t.string :todo_name
      t.boolean :complete

      t.timestamps
    end
  end
end
