class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url_air = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=33309&distance=25&API_KEY=A0D4F553-1C54-452E-9A6E-6F30392403CB'
    @uri = URI(@url_air)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
      @final_output = "Error has ocurred, please verify the Zip Code entered"
    elsif !@output
      @final_output = "Error"
    else
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_color = "gray"
    elsif @final_output <= 50
      @api_color = "green"
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
    elsif @final_output >= 101 && @final_output <= 150
      @api_color = "orange"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "magenta"
    else @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
    end

    @url_weather = 'https://www.airnowapi.org/aq/forecast/zipCode/?format=application/json&zipCode=33309&date=2022-10-19&distance=25&API_KEY=A0D4F553-1C54-452E-9A6E-6F30392403CB'
    @uri_w = URI(@url_weather)
    @response_w = Net::HTTP.get(@uri_w)
    @output_w = JSON.parse(@response_w)

  end
end
