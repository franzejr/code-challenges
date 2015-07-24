class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name, null: false
      t.string :email,null: false

      t.references :vacancy, index: true
      t.timestamps null: false
    end
  end
end
