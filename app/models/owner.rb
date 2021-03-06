class Owner < ActiveRecord::Base

  has_one :shop
  before_validation :default_values

  enum status: { inactive: 0, active: 1 }
  enum role: { admin: 0, owner: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :shop, allow_destroy: true

  validates :email, presence: true
  validates :password, presence: true

  def default_values
    self.status ||= 0
    self.role ||= 1
  end
end
