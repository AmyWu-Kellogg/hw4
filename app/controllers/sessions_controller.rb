class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user != nil && @user.authenticate(params["password"])
      session["user_id"] = @user["id"]
      redirect_to "/places"
    else
      redirect_to "/session/new"
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to "/session/new"
  end
end
  