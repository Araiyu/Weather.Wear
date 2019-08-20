class FavoritesController < ApplicationController

	def create
		clothe = Clothe.find(params[:clothe_id])
		favorite = current_user.favorite.new(clothe_id: clothe.id)
		favoite.save
		redirect_to clothe_path(clothe)
	end
	def destory
		clothe = Clothe.find(params[:clothe_id])
		favorite = current_user.favorites.find_by(clothe_id: clothe.id)
		favorite.destory
		redirect_to clothe_path(clothe)
	end
private
	def comment_params
		params.require(:comment).permit(:clothe_id)
	end
end