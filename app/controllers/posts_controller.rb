class PostsController < AuthController
  before_action :authenticate_from_token, only: [:create, :update]

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      render json: {post: post}
    else
      render json: {error: post.errors.full_messages}, status: 422
    end
  end

  def update
    post = Post.where(token: post_params[:token]).first
    if post.update(post_params)
      render json: {post: post}
    else
      render json: {error: post.errors.full_messages}, status: 422
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :published, :token)
  end


end
