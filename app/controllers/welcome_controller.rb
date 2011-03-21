class WelcomeController < ApplicationController
  def index
    @messages = Message.order("created_at DESC").limit(10).all
    
  end

  def about
  end

end
