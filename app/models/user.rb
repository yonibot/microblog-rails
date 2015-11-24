class User < ActiveRecord::Base
  has_many :posts
  validates :email, uniqueness: true
  validates :password_digest, :name, presence: true
  has_secure_password
  before_create :set_token

  def set_token
    unless self.token
      self.token = SecureRandom.uuid
    end
  end
end
