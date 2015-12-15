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
          promotion = Promotion.joins(:shop).where('shop_id IN (?) AND expires_at > ?', current_user.shops.pluck(:id), Date.today).select('promotions.*', 'promotions.id', 'promotions.name AS pName', 'shops.name, shops.id AS sId, shops.address').order(created_at: :desc)

          # if shop
          #   shop
          # else
          #   ''
          # end
        end

        params do
          requires :token, type: String, desc: "Access token."
        end
        desc "Return all promotions of the subscribed shops"
        get '/:id' do
          authenticate!
          promotion = Promotion.joins(:shop).where(id: params[:id]).select('promotions.*', 'promotions.id', 'promotions.name AS pName', 'shops.name, shops.id AS sId, shops.address').first

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
