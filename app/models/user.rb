class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :shops, through: :subscriptions
end
