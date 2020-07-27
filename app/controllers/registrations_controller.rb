class RegistrationsController < ApplicationController
  # Create new user
  def create
    user = User.create(
      username: params['user']['username'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )
    if user
      if user.id
        session[:user_id] = user.id
        render json: {
          status: :created,
          user: user
        }
      else
        render json: {
          status: :conflict
        }
      end
    else
      render json: { status: :internal_server_error }
    end
  end

end
