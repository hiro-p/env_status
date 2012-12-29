class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!


  helper_method :current_user  
  helper_method :user_signed_in?
    
  private  
  def user_signed_in?
    return 1 if current_user 
  end
    
  def authenticate_user!

    if request.headers['token']
      unless current_user
        flash[:error] = 'You need to sign in before accessing this page!'
        redirect_to '/signin'
      end
    elsif !current_user
      flash[:error] = 'You need to sign in before accessing this page!'
      redirect_to '/signin'
    end
  end

  def current_user  
    if request.headers['token']
      @current_user ||= User.where(token: request.headers['token']).first
    else
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    end
  end  
end