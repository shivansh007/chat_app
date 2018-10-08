class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_login!, only: [:create]

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      auth_token = user.generate_auth_token
      render json: { auth_token: auth_token }
    else
      invalid_login_attempt
    end

  end

  def destroy
    user = current_person
    user.invalidate_auth_token
    head :ok
  end

  private

  def invalid_login_attempt
    render json: { errors: [ { detail: "Invalid email or password." }]}, status: 401
  end
end
