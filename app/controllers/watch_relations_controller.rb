class WatchRelationsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    film = Film.find(params[:film_id])
    current_user.watch(film, params[:watch_relation][:rate], params[:watch_relation][:comment])
    flash[:success] = 'watched this film!'
    redirect_to film
  end

  def destroy
    film = Film.find(params[:film_id])
    current_user.undo_watch(film)
    flash[:success] = 'unwatched this film!'
    redirect_to film
  end
  
  def edit
    @watch_relation = WatchRelation.find(params[:id])
    
  end
  
  def update
    @watch_relation = WatchRelation.find(params[:id])
    @watch_relation.update(watch_relation_params)
    flash[:success] = 'updated the rating!'
    redirect_to root_url
  end
end

private
def watch_relation_params
  params.require(:watch_relation).permit(:user_id, :film_id, :rate, :comment)
end