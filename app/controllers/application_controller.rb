class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :locale_asignment

  def authenticate_admin
    unless current_user.admin?
      flash[:error] = "Need administrator rights"
      redirect_to root_path
    end
  end
  
  private
  def locale_asignment
    I18n.locale = session[:locale].nil? ? I18n.default_locale : session[:locale]
  end

end

