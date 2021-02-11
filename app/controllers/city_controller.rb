class CityController < ApplicationController

    def show
        @this_city = City.find(params[:id])


    end




end