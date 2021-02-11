module SessionHelper

    def current_user
        Author.find_by(id: session[:author_id])
    end

   
end