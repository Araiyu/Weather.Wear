class CommentsController < ApplicationController

	def create
		@clothe = Clothe.find(params[:clothe_id])
		@comment = Comment.new(comment_params)
		@comment.clothe_id = @clothe.id
		@comment.user_id = current_user.id
		@comment.save
		redirect_to clothe_path(@comment.clothe_id)
	end
	def destroy
		@clothe = Clothe.find(params[:clothe_id])
		@comment = @clothe.commnets.find(params[:id])
		@comment.destroy
		redirect_to clothe_path(@clothe)
	end

	private
	def comment_params
		params.require(:comment).permit(:clothe_id,:review)
	end
end
