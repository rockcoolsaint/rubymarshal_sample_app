class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@title = @user.name
  end
  
  def new
  	@user = User.new
  	@title = "Sign up"
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		# Handle a successful save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
  		redirect_to user_path(@user)
  	else
  		@title = "Sign up"
  		render 'new'
  	end
  end

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end