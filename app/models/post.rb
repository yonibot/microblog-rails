class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :content, :published, :token, presence: true
  before_validation :set_token, on: :create

  private

  def set_token
    unless self.token
      self.token = SecureRandom.uuid
    end
  end
end
