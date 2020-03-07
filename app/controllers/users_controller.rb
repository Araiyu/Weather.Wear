class UsersController < ApplicationController
	API_KEY = ENV["API_KEY"]
	BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
	IMG_URL = "http://openweathermap.org/img/w/"

	def index
		response = open(BASE_URL + "?q=Tokyo&APPID=#{API_KEY}")
		@weather_d = JSON.parse(response.read)
		current_temp = @weather_d["main"]["temp"].to_i - 273.15
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@favo_clothes = @user.favorite_clothes # @userがお気に入りした投稿
	end

	def edit
		@user =User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(current_user.id)
	end

	def destroy
		user =User.find(params[:id])
		user.destroy
		redirect_to root_path
	end

private
	def user_params
		params.require(:user).permit( :nickname, :gender, :tall, :introduction, :email, :user_image)
	end
end