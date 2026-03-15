class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :current_user

  def set_current_user
    @current_user = User.find_by({ "id" => session["user_id"] })
  end

  def current_user
    @current_user
  end

  def require_login
    if current_user == nil
      redirect_to "/session/new"
    end
  end
end
