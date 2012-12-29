class SessionsController < ApplicationController 
  skip_before_filter :authenticate_user!, :only => [:new, :create, :destroy, :failure]
  def new

  end

  def create  
    auth = request.env["omniauth.auth"]  
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)  
    session[:user_id] = user.id 
    
    session[:role] ||= [] 
    #if auth['user_info']['groups'].include? 'IT'
    #  session[:role] << 'admin'
    #end

    redirect_to root_url, :notice => "Signed in!"  
  end 

  def destroy  
    session[:user_id] = nil  
    flash[:notice] = "Sucessfully Signed Out!"
    redirect_to '/signin'
  end 

  def failure
    flash[:error] = "Invalid username or password"
    redirect_to '/signin'
  end 
end  