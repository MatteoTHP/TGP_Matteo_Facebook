class GossipController < ApplicationController
  
  
    def index #methode page welcome
       
    end

    def show #methode page pour montrer les gossips
      @this_gossip =  Gossip.find(params[:id])
      @author_id = Gossip.find(params[:id]).author_id
      @author_name = Author.find(Gossip.find(params[:id]).author_id).first_name
      @author_city = City.find(@this_gossip.author.city_id).name
        
    end

    def new #methode page pour montrer les gossips
      @gossip = Gossip.new
      #@comment = Comment.new(gossip_id: params[:gossip_id])
        
    end

    def create
        @gossip = Gossip.new(title: params["title"], content: params["content"], author_id: Author.all.sample.id, date: Faker::Time.forward) # avec xxx qui sont les données obtenues à partir du formulaire
        # @gossip.author = Author.find_by(id: session[:user_id])
        if @gossip.save # essaie de sauvegarder en base @gossip
          # si ça marche, il redirige vers la page d'index du site
            flash[:notice] = 'Successfully entered the Gossip !'
            redirect_to "/"
          
        else
          # sinon, il render la view new (qui est celle sur laquelle on est déjà)

          render "/gossip/new"
        end
    end

    def edit
      @gossip = Gossip.find(params[:id])
      


    end

    def update
      @gossip = Gossip.find(params[:id])
      
      gossip_params = params.require(:gossip).permit(:title, :content)
      @gossip.update(gossip_params)
      flash[:notice] = 'Successfully edited the Gossip !'
      
      redirect_to gossip_path
    
    end

    def destroy
      @gossip = Gossip.find(params[:id])

      @gossip.destroy

      flash[:notice] = 'Successfully deleted the Gossip !'
      redirect_to root_path
    end

    private

 
end