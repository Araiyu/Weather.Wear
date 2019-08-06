class ClothesController < ApplicationController

	def new
		@clothe = Clothe.new
	end

	def create
		@clothe = Clothe.new(clothe_params)
		@clothe.save
		redirect_to clothes_path
	end

	def index
		@clothes = Clothe.all
	end

	def show
		@clothe = Clothe.find(params[:id])
	end

	def edit
		@clothe = Clothe.find(params[:id])
	end

	def update
		clothe = Clothe.find(params[:id])
	end

private
	def clothe_params
		params.require(:clothe).permit(:temperature, :weather, :rainy_pecent, :clothes_image)
	end
end
