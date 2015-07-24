class CompaniesController < ApplicationController

	def index
		render json: Company.all
	end

	def show
		find_company
		render json: @company
	end

	private

	def find_company
		@company = Company.find(params[:id])
	end
end
