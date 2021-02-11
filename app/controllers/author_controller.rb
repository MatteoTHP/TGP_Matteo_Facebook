class AuthorController < ApplicationController

    def author #methode page pour montrer les auteurs
            
    end

    def new
        @author = Author.new

    end

    def create
        @author = Author.new(first_name: params[:firstname],
            last_name: params[:lastname],
            email: params[:email],
            age: Faker::Number.number(digits: 2),
            description: Faker::Lorem.sentences(number: 1),
            city_id: City.all.sample.id,
            password: params[:password]) 

        @author.save

        redirect_to "/"
    end

    def show #methode page pour montrer les gossips
        @this_author = Author.find(params[:id])
        
    end

end