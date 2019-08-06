class ClothesController < ApplicationController
	def new
		@clothe =Clothe.new
	end
	def create
		clothe =Clothe.new(clothe_params)
		clothe.save
		redirect_to '/top'
	end

	def index
		@clothes =Clothe.all
		@clothe =Clothe.new
	end

	def show
		@clothe =Clothe.find(params[:id])

	def edit
		@clothe =Clothe.find(params[:id])
	end

	def update
		clothe = Clothe.find(params[:id])
	end

	praivate
	def clothe_params
		params.require(:clothe).permit(:temperature, :weather, :rainy_pecent, :clothes_image_id)
	end
end
