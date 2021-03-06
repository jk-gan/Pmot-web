class User < ActiveRecord::Base
  has_secure_password
  has_many :devices
  has_many :subscriptions
  has_many :shops, through: :subscriptions

  before_validation :default_values

  enum status: { active: 0, deleted: 1 }

  attr_accessor :created

  validates :email, uniqueness: true

  private

  def default_values
    self.status ||= 0
  end
end
