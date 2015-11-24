class User < ActiveRecord::Base
  has_many :posts
  validates :email, uniqueness: true
  has_secure_password

  def set_token
    unless self.token
      self.token = SecureRandom.uuid
    end
  end
end
