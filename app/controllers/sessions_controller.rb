class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash.now[:success] = " you have logged in"
      redirect_to user_path(user)
    else
      flash.now[:danger] = " Something went wrong"
      render 'new'
    end
end
   

  
  def destroy
    session[:user_id] = nil
    flash[:success] = "you have logged out"
    redirect_to root_path
  end
  
end
