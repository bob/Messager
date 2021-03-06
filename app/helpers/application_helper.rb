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

  def user_links_list(users)
    links = []
    users.each do |user|
    	links << link_to(user.fullname, show_user_path(user.id))
    end

    links.join(", ").html_safe
  end

  def categories_joined_to_line(categories)
    categories_joined = []
    categories.each do |category|
    	categories_joined << category.name
    end

    categories_joined.join(", ")
  end

end

