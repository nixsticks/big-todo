class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.belongs_to :todolist

      t.timestamps
    end
  end
end
