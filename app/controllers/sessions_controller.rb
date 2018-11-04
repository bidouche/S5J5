class SessionsController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	puts '#########################################'
  	puts params.inspect
  	@user = User.create(params[:user])
  	render 'new'
  end
  def show
       @user = User.find(params[:id])
  end
end
