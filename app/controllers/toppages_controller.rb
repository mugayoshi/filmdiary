class ToppagesController < ApplicationController
  def index
    if logged_in?
      @films = Film.all.order(release_date: :desc).page(params[:page])
    end
  end
end
