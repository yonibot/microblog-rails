class AuthController < ApplicationController

  def login
    user = User.where(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      response.headers["AUTH-TOKEN"] = user.token
      render json: {user: user}
    end
  end

  def authenticate_from_token
    user = User.where(token: request['AUTH-TOKEN'])
    if user
      @current_user = user
    else
      render json: {error: "Unauthorized."}, status: 401
    end
  end


end
