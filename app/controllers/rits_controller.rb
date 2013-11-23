class RitsController < ApplicationController
	def index
		@ritly = Rit.all
	end

	def new
		@ritly = Rit.new
	end

	def create
		@ritly = Rit.new(safe_rit_param)
		@ritly.hashcode = rand(100000)

		@ritly.save
	end

	def show
		@ritly = Rit.find(params[:id])
	end

	def edit
		@ritly = Rit.find(params[:id])
	end

	def destroy
		@ritly = Rit.find(params[:id])
		@ritly.destroy

		redirect_to root_path
	end	

	def preview
		@ritly = Rit.find(params[:id])
	end

	private

	def safe_rit_param
		params.require(:rit).permit(:url)
	end

end
