class Vacancy < ActiveRecord::Base
	validates :title, presence: true
	has_one :position
	belongs_to :company
	has_and_belongs_to_many :applicants
end
