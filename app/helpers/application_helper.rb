module ApplicationHelper

  def display_current_user_name
    current_user.name.blank? ? name = current_user.nickname : name = current_user.name
    "you are logged in as #{name}"
  end

  def display_name(user)
    user.name.blank? ? name = user.nickname : name = user.name
    name
  end
end
