require "net/http"
require "open-uri"
require "json"

API_KEY ="b8751728158c4e7f85a34a92a0c2d5aa"
BASE_URL = "http://api.openweathermap.org/data/2.5/weather"

response = open(BASE_URL + "?q=Tokyo&APPID=#{API_KEY}")
puts JSON.pretty_generate(JSON.parse(response.read))
