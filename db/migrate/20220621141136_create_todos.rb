class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :add_task
      t.string :date
      t.boolean :completed

      t.timestamps
    end
  end
end
