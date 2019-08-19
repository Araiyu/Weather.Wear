class CommentsController < ApplicationController

	def create
		@clothe = Clothe.find(params[:clothe_id])
		@comment = Comment.new(comment_params)
		@comment.clothe_id = @clothes.clothe_id
		@commnet.save
		redirect_to clothe_path(@comment.clothe_id)
	end
	def destroy
	end

	private
	def comment_params
		params.requore(:comment).permit(:review,:clothe_id)
	end
end
