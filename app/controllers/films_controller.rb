class FilmsController < ApplicationController
  def create
    @film = Film.new(film_params)
    
    if @film.save
      flash[:success] = 'Adding film success!'
      redirect_to @film
    else
      flash.now[:danger] = 'Adding film  failed!'
      render :new
    end
  end
  
  def new
    @film = Film.new
  end
  
  def show
    @film = Film.find(params[:id])
    @wach_relation = current_user.watch_relations.find_by(film_id: @film.id)
  end
  
  def edit
    @film = Film.find(params[:id])
  end
  
  def update
    @film = Film.find(params[:id])
    @film.update(film_params)
    flash[:success] = 'update the film info!'
    redirect_to @film
  end
end

private

def film_params
  params.require(:film).permit(:title, :director, :image, :release_date, :original_title, :lang, :description)
end