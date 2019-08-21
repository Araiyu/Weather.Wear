class FavoritesController < ApplicationController

	def create
		clothe = Clothe.find(params[:clothe_id])
		favorite = current_user.favorites.new(clothe_id: clothe.id)
		favorite.save
		redirect_to clothe_path(clothe)
	end
	def destroy
		clothe = Clothe.find(params[:clothe_id])
		favorite = current_user.favorites.find_by(clothe_id: clothe.id)
		favorite.destroy
		redirect_to clothe_path(clothe)
	end
private
	def comment_params
		params.require(:comment).permit(:clothe_id)
	end
end