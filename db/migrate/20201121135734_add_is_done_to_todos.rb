class AddIsDoneToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :is_done, :boolean
  end
end
