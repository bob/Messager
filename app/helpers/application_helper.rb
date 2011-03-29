module ApplicationHelper
  def user_human(user)
    user.fullname.blank? ? user.email : user.fullname
  end

  def is_current_forhighlighting(path)
    if current_page? path
    #if ( params[:controller] + '/' + params[:action] ) == path
	    return 'current'
    end
  end

end
