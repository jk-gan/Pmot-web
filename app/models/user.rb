class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :shops, through: :subscriptions

  before_validation :default_values

  enum status: { active: 0, deleted: 1 }

  attr_accessor :created

  def default_values
    self.status ||= 0
  end
end
