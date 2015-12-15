class Promotion < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :shop

  validates :name, presence: true
  validates :term_and_condition, presence: true
  validates :image, presence: true
  validates :starts_at, presence: true
  validates :expires_at, presence: true
  validates :description, presence: true

  # before_validation :default_values

  # private

  # def default_values
  #   self.shop_id ||= current_owner.shop.id
  # end
end
