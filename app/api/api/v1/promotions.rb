module API
  module V1
    class Promotions < Grape::API
      version 'v1'
      format :json

      resource :promotions do
        params do
          requires :token, type: String, desc: "Access token."
        end
        desc "Return all promotions of the subscribed shops"
        get do
          authenticate!
          promotion = Promotion.joins(:shop).where(shop_id: current_user.shops.pluck(:id)).select('promotions.*', 'promotions.id', 'promotions.name AS pName', 'shops.name, shops.id AS sId, shops.address')

          # if shop
          #   shop
          # else
          #   ''
          # end
        end
      end
    end
  end
end
