class SessionsController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	  user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  def show
       @user = User.find(params[:id])
  end

  def destroy
  	log_out
    redirect_to root_url
  end
   def log_in(user)
    session[:user_id] = user.id
  end
 
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
