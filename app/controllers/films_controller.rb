class FilmsController < ApplicationController
  def create
  end

  def show
    @film = Film.find(params[:id])
  end
end
