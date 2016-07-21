class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def can_edit_object(object)
    if !current_user
      return false
    end

    if has_role? 'admin'
      return true
    end

    if object.respond_to?(:author) and object.author == current_user
      return true
    end

    return false
  end

  helper_method :can_edit_object
end
