module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user_content?(content_user)
    if content_user == current_user
      true
    else
      false
    end
  end

  def logged_in?
    current_user.present?
  end

end
