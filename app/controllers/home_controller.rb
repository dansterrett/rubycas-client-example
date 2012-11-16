class HomeController < ApplicationController
  # This will force CAS authentication before the user
  # is allowed to access any action in this controller, except for index. 
  prepend_before_filter RubyCAS::GatewayFilter, :only => :index
  prepend_before_filter RubyCAS::Filter, :except => :index

  #GET /
  def index
    
  end

  def private

  end

end