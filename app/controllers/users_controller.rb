class UsersController < ApplicationController

	def index
		@user = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user =User.find(params[:id])
		if @user.id !=current_user.id
			redirect_to root_path
		end
	end

	def update
		@user = User.find(params[:id])
		if@user.update(use_params)
			redirect_to user_path(current_user)
		else
			render :edit
		end
	end

	def destroy
		user =User.find(params[:id])
		if user.destroy
			redirect_to root_path
		end
	end

private
	def user_params
		params.require(:user).permit( :nickname, :gender, :tall, :introduction, :email)
	end
end