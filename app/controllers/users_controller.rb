class UsersController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
	def new
		@user = User.new
	end
	def create
  		 @user = User.new(user_params)    # Not the final implementation!
    if  @user.save
    	flash[:success] = "Welcome to the Sample App!"
     	redirect_to @user
     else
       render 'new'
    end
	end
	def show
		@user = User.find(params[:id])
	end
	def destroy
		
	end
	def index
		@user = User.all
	end
	def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
