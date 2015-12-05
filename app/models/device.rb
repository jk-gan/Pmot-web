class Device < ActiveRecord::Base
  belongs_to :user
  validates :token, uniqueness: { scope: :user_id }
end
