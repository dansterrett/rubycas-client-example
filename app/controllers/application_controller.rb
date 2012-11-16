class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_user_instance

  def set_current_user_instance
    @current_user = session[:cas_user]
  end
end
