class WelcomeController < ApplicationController
  def index
    @messages = Message.order("created_at DESC").limit(10).all
  end

  def about
  end

  def set_locale
    if I18n.available_locales.include? params[:locale].to_sym
      session[:locale] = params[:locale].nil? ? I18n.default_locale : params[:locale]
    end
    
    redirect_to request.referer || root_path
  end

end
