class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
  		 @user = User.new(user_params)    # Not the final implementation!
    if  @user.save
     	log_in @user
		 flash[:success] = "Welcome #{@user.email}"
		 redirect_to @user
        Handle a successful save.
     else
       redirect_to root_path
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
