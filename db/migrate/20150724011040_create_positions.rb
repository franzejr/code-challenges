class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name, null: false
      t.references :company, index: true

      t.timestamps null: false
    end
  end
end
