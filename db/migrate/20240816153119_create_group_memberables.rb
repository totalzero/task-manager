class CreateGroupMemberables < ActiveRecord::Migration[7.1]
  def change
    create_table :group_memberables do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
