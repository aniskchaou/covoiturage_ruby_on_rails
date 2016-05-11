class MembresController < ApplicationController
  def index
     @membres = Membre.all
  end

  def new
    @membres = Membre.new()
  end
  

  def create
    @membre = Membre.new(membre_params)
    if @membre.save
      redirect_to :action => 'index'
    end
  end


  def show
   @membre=Membre.find(params[:id])
  end

  def edit
    @membre = Membre.find(params[:id])
  end

  def update
    @membre = Membre.find(params[:id])
    if @membre.update_attributes(membres_param)
      redirect_to :action => 'show', :id => @membre
    end
  end

  def delete
      Membre.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def membre_params
    params.require(:membres).permit(:nom, :prenom, :age, :mdp,:email)
  end

  def membres_param
    params.require(:membre).permit(:nom, :prenom, :age, :mdp,:email)
  end



end