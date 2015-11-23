module API
  module V1
    class Shops < Grape::API
      version 'v1'
      format :json

      resource :shops do
        params do
          requires :identity, type: String, desc: "Shop's identity."
          requires :token, type: String, desc: "Access token."
        end
        desc "Return a shop"
        get do
          authenticate!
          shop = Shop.find_by(identity: params[:identity])
          if shop
            shop
          else
            ''
          end
        end

        params do
          requires :token, type: String, desc: "Access token."
        end
        desc "Return a list of subscribed shops"
        get :subscribe do
          authenticate!
          shop = current_user.shops
          if shop
            shop
          else
            ''
          end
        end

        params do
          requires :id, type: String, desc: "Shop's id."
          requires :token, type: String, desc: "Access token."
        end
        desc "Subscribe a shop"
        post :subscribe do
          authenticate!
          shop = Shop.find_by(id: params[:id])
          if shop
            current_user.shops << shop
            current_user
          else
            ''
          end
        end
      end
    end
  end
end
