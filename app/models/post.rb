class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :content, :token, :user_id, presence: true
  before_validation :set_token

  private

  def set_token
    self.token ||= SecureRandom.uuid
  end

end
