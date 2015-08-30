class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.references :notificable, polymorphic: true
      t.boolean :seen, default: false
      t.timestamps null: false
    end
    add_index :notifications, :user_id
    add_index :notifications, [:notificable_id, :notificable_type]
  end
end
