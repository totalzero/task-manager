class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
t.string :status, default: "pending"

t.references :group, null: false, foreign_key: true
t.references :assigned_to, foreign_key: {to_table: :users}
t.references :creator, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
