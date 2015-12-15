class HomeController < ApplicationController
  require 'rqrcode_png'
  def index
   if owner_signed_in?
     if current_owner.admin?
       redirect_to admin_root_path
     elsif current_owner.active?
       @qr = RQRCode::QRCode.new("Pmot@" + current_owner.shop.identity).to_img.resize(200, 200).to_data_url
       @promo_count = Promotion.where(shop_id: current_owner.shop.id).count
       @follower = Subscription.where(shop_id: current_owner.shop.id).count
     elsif current_owner.inactive?
       redirect_to edit_shop_path(current_owner.shop)
     end
   else
     redirect_to new_owner_session_path
   end
  end
end
