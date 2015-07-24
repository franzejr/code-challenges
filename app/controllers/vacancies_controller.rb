class VacanciesController < ApplicationController

	def index
		render json: Vacancy.all
	end

	def show
		find_vacancy
		render json: @vacancy
	end

	private

	def find_vacancy
		@vacancy = Vacancy.find(params[:id])
	end
end
