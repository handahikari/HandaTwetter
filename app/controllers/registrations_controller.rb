class RegistrationsController < ApplicationController
  def new
  	@user = User.new
    redirect_to tweets_url if logged_in?
  end
  def create 
  	@user = User.new(params_user)
    email = params_user[:email]
    password = params_user[:password]
  	if @user.save
      login(email, password)
      redirect_to tweets_url
  	else
  		render :new
  	end
  end

  private 

  def params_user
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
