class Shop < ActiveRecord::Base
  belongs_to :owner
  has_many :promotions
end
