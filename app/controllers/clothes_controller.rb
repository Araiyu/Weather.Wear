class ClothesController < ApplicationController

	def new
		@clothe = Clothe.new
	end

	def create
		clothe = Clothe.new(clothe_params)
		clothe.user_id = current_user.id
		clothe.save
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
	def destroy
		@clothe = Clothe.find(params[:id])
		@Clothe.destroy
		redirect_to clothes_path
	end

private
	def clothe_params
		params.require(:clothe).permit(:temperature, :weather, :rainy_percent, :clothes_image)
	end
end
