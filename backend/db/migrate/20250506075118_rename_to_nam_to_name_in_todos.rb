class RenameToNamToNameInTodos < ActiveRecord::Migration[7.2]
  def change
    rename_column :todos, :to_nam, :todo_name
  end
end
