class UsersController < ApplicationController 
  before_action :load_reservations, :only => [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

     if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
     else 
      render "new"
     end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to user_path(@user.id)
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def load_reservations
    @reservations = current_user.reservations

  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
