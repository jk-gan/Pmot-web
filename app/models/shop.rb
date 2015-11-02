class Shop < ActiveRecord::Base
  belongs_to :owner
  has_many :promotions
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
