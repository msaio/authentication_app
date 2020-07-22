class SessionsController < ApplicationController
  include CurrentUserConcern
  
  # Create session
  def create
    user = User
      .find_by(username: params["user"]["username"])
      .try(:authenticate, params["user"]["password"])
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user,
      }
    else
      render json: { status: :unauthorized }
    end
  end

  # Check if logged in
  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user,
      }
    else
      render json: {
        logged_in: false,
      }
    end
  end

  # logout
  def logout
    reset_session
    render json: {
      status: :ok, logged_out: true 
    }
  end

end
