class WatchRelationsController < ApplicationController
  def create
    film = Film.find(params[:film_id])
    current_user.watch(film, params[:watch_relation][:rate], params[:watch_relation][:comment])
    flash[:success] = 'watched this film!'
  end

  def destroy
    film = Film.find(params[:film_id])
    current_user.unwatch(film)
    flash[:success] = 'unwatched this film!'
  end
end

private
def watch_relation_params
  params.require(:watch_relation).permit(:user_id, :film_id, :rate, :comment)
end