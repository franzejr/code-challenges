class CreateApplicantsVacancies < ActiveRecord::Migration
  def change
    create_table :applicants_vacancies do |t|
      t.belongs_to :vacancy, index: true
      t.belongs_to :applicant, index: true
    end
  end
end
