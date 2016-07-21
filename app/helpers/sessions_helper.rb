module SessionsHelper
  def current_user
    if session[:user_id]
      begin
        @current_user ||= User.find(session[:user_id])
      rescue
        @current_user = nil
      end
    end
  end

  def has_role? (role)
    if !current_user
      return false
    end

    return (session[:roles] != nil and session[:roles].include?(role))
  end
end
