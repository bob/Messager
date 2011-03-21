module ApplicationHelper
  def user_human(user)
    user.fullname.blank? ? user.email : user.fullname
  end
end
