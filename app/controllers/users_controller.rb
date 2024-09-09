class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'User was successfully created.'
      redirect_to @user
    else
      flash.now[:alert] = 'Error creating user. Please fix the problems below.'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User was successfully updated.'
      redirect_to @user
    else
      flash.now[:alert] = 'Error updating user. Please fix the problems below.'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User was successfully deleted.'
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
