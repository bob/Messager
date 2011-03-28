module ApplicationHelper
  def user_human(user)
    user.fullname.blank? ? user.email : user.fullname
  end

  def is_current_forhighlighting(path)
    if current_page? path
	    return 'current'
    end
  end

end
