class Shop < ActiveRecord::Base
  belongs_to :owner
  has_many :promotions
  has_many :subscriptions
  has_many :users, through: :subscriptions
  before_create :generate_identity

  def generate_identity
    self.identity = SecureRandom.urlsafe_base64
  end
end
