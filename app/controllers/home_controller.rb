class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url_air = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=33309&distance=25&API_KEY=A0D4F553-1C54-452E-9A6E-6F30392403CB'
    @uri = URI(@url_air)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    @url_weather = 'https://www.airnowapi.org/aq/forecast/zipCode/?format=application/json&zipCode=33415&date=2022-10-19&distance=25&API_KEY=A0D4F553-1C54-452E-9A6E-6F30392403CB'
    @uri_w = URI(@url_weather)
    @response_w = Net::HTTP.get(@uri_w)
    @output_w = JSON.parse(@response_w)
    
  end
end
