class AuthController < ApplicationController

  def login
    user = User.where(email: params[:user][:email]).first
    if user && user.authenticate(params[:user][:password])
      response.headers["AUTH-TOKEN"] = user.token
      render json: {user: user.attributes.except('password_digest', 'id'}
    end
  end

  def current_user
    User.where(token: request.headers['AUTH-TOKEN']).first
  end

  protected

  def authenticate_from_token
    user = User.where(token: request.headers['AUTH-TOKEN']).first
    if !user
      render json: {error: "Unauthorized."}, status: 401
    end
  end

end
