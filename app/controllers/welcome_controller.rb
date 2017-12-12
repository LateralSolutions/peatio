class WelcomeController < ApplicationController
  layout 'landing'
  def index 	
  end
  
  def start 
 	redirect_to market_path(Market.first)
  end
end
