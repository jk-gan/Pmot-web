class Shop < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :owner
  has_many :promotions
  has_many :subscriptions
  has_many :users, through: :subscriptions
  # before_update :activation
  before_create :generate_identity

  def generate_identity
    self.identity = SecureRandom.urlsafe_base64
  end
  #
  # def activation
  #   owner = Owner.find(self.owner_id)
  #   owner.update(status: 1)
  # end
end
