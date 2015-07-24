class Company < ActiveRecord::Base
	validates :name, presence: true
	validates :address, presence: true
	has_many :positions
	has_many :vacancies
end
