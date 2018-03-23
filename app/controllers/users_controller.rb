class UsersController < ApplicationController
  def new 
    
  end

  def create 
    user = User.new( 
                    name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password]
                    )

    if user.save
      session[:user_id] = user.id
        flash[:success] = "You have Successfully Created an Account!"
        redirect_to '/'
    else
      flash[:warning] = "Your Username or Password is Invalid"
      redirect_to '/'
    end
  end
      
end
