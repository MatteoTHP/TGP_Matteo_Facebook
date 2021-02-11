
class SessionsController < ApplicationController

    def new
        @author = Author.new


    end


    def create

        
        current_author = Author.find_by(email: params[:email])
        
       
        # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
        if current_author && current_author.authenticate(params[:password])
          session[:author_id] = current_author.id
          # redirige où tu veux, avec un flash ou pas
          flash.now[:danger] = 'ya qqch qui saffiche'
          redirect_to root_path
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render :new
        end


    end

    def destroy
        session.delete(:author_id)

    end






end