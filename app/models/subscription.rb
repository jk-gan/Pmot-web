class Subscription < ActiveRecord::Base
  belongs_to :users
  belongs_to :shops
end