class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.all.page(params[:page])
    # .page() is for pagination by kaminari
  end

  def show
    @user = User.find(params[:id])
    @watched_films = @user.watched_films.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'Sign up success!'
      redirect_to @user
    else
      flash.now[:danger] = 'Sign up failed!'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = 'updated user info'
    redirect_to @user
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
end