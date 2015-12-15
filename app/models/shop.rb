class Shop < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :owner
  has_many :promotions
  has_many :subscriptions
  has_many :users, through: :subscriptions
  before_create :generate_identity

  validates :name, presence: true, unless: :new_record?
  validates :address, presence: true, unless: :new_record?
  validates :image, presence: true, unless: :new_record?
  validates :phone, presence: true, unless: :new_record?
  validates :description, presence: true, unless: :new_record?

  # attr_accessor :updating

  def generate_identity
    self.identity = SecureRandom.urlsafe_base64
  end
end
