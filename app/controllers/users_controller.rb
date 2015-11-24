class UsersController < AuthController

  def create
    user = User.new(user_params)
    if user.save
      response.headers["AUTH-TOKEN"] = user.token
      render json: {user: user}
    else
      render json: {error: user.errors.full_messages}, status: 422
    end
  end


end
