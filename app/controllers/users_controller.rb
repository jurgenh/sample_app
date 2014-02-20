class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  # this is invoked through the edit/update button
  def update
    # get the user to update...don't we already know?
    @user = User.find(params[:id])
    # this uses string parameters to prevent mass assignment
    # vulnerability.
    #
    # ok...got it...where is user_params
    if @user.update_attributes(user_params)
      # listing 9.10 makes this work.
      flash[:success] = "Profile updated"
      redirect_to @user
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
