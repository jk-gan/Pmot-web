class HomeController < ApplicationController
  require 'rqrcode_png'
  def index
   if owner_signed_in?
     if current_owner.admin?
       redirect_to admin_root_path
     else
       @qr = RQRCode::QRCode.new(current_owner.email).to_img.resize(200, 200).to_data_url
     end
   else
     redirect_to new_owner_session_path
   end
  end
end
