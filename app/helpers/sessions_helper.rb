module SessionsHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def has_role? (role)
    if !current_user
      return false
    end

    return session[:roles].include?(role)
  end
end
