class Promotion < ActiveRecord::Base
  belongs_to :shop

  # before_validation :default_values

  # private

  # def default_values
  #   self.shop_id ||= current_owner.shop.id
  # end
end
