class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string  :title, null: false
      t.text  :description

      t.references :company , index: true
      t.references :applicant , index: true
      t.belongs_to :position, index: true
      t.timestamps null: false
    end
  end
end
