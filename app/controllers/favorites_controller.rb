class FavoritesController < ApplicationController

	def create
		clothe = Clothe.find(params[:clothe_id])
		favorite = current_user.favorite.new(clothe_id: clothe.id)
		favoite.save
		redirect_to clothe_path(clothe_image)
	end
	def destory
		clothe =Clothe.find(params[:clothe_image_id: clothe.id])
		favorite = current_user.favorites.find_by(clothe_id: clothe.id)
		favorite.destory
		redirect_to clothe_path(clothe)
	end
end
