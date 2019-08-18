class UsersController < ApplicationController
	API_KEY ="b8751728158c4e7f85a34a92a0c2d5aa"
	BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
	IMG_URL = "http://openweathermap.org/img/w/"

	def index
		response = open(BASE_URL + "?q=Tokyo&APPID=#{API_KEY}")
		@weather_d= JSON.parse(response.read)
		current_temp = @weather_d["main"]["temp"].to_i - 273.15
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