class SessionsController < ApplicationController
  def new
    
  end

  def create 
    user = User.find(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in, nice."
      redirect_to '/'
    else
      flash[:warning] = "Invalid password or email."
      redirect_to '/login'
    end
  end

  def destroy 
    session[:user_id] = nil
    flash[:success] = "Succefully logged out."
    redirect_to '/login'
  end
end
