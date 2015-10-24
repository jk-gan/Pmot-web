class HomeController < ApplicationController
  require 'rqrcode_png'
  def index
   if user_signed_in?
     @qr = RQRCode::QRCode.new(current_user.email).to_img.resize(200, 200).to_data_url
   else
     redirect_to new_owner_session_path
   end
  end
end
