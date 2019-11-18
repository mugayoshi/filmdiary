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
end

private

def film_params
  params.require(:film).permit(:title, :director, :image, :release_date, :original_title, :lang, :description)
end