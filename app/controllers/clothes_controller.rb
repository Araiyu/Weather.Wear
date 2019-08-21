class ClothesController < ApplicationController
	API_KEY ="b8751728158c4e7f85a34a92a0c2d5aa"
	BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
	IMG_URL = "http://openweathermap.org/img/w/"

	def new
		response = open(BASE_URL + "?q=Tokyo&APPID=#{API_KEY}")
		@weather_d= JSON.parse(response.read)
		current_temp = @weather_d["main"]["temp"].to_i - 273.15
		@clothe = Clothe.new
		@weather_img = IMG_URL + @weather_d["weather"].first["icon"] + ".png"
	end

	def create
		clothe = Clothe.new(clothe_params)
		clothe.user_id = current_user.id
		clothe.save
		redirect_to clothes_path
	end

	def index
		response = open(BASE_URL + "?q=Tokyo&APPID=#{API_KEY}")
		@weather_d= JSON.parse(response.read)
		current_temp = @weather_d["main"]["temp"].to_i - 273.15
		@clothes_t = Clothe.where("(temperature >= ?)AND(temperature <= ?)",current_temp -3.5,current_temp +3.5)
		@clothes = Clothe.all
		@weather_img = IMG_URL + @weather_d["weather"].first["icon"] + ".png"
	end

	def show
		@clothe = Clothe.find(params[:id])
		@comments =Comment.new
		@comment = @clothe.comments
	end

	def edit
		@clothe = Clothe.find(params[:id])
	end

	def update
		clothe = Clothe.find(params[:id])
		clothe.update(clothe_params)
		redirect_to clothe_path(clothe)
	end
	def destroy
		clothe = Clothe.find(params[:id])
		clothe.destroy
		redirect_to clothes_path
	end

private
	def clothe_params
		params.require(:clothe).permit(:temperature, :weather, :clothe_text, :clothes_image, :user_id)
	end
end
