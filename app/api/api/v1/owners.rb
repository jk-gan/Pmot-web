module API
  module V1
    class Owners < Grape::API
      version 'v1'
      format :json

      resource :owners do
        params do
          requires :token, type: String, desc: "Access token."
        end
        desc "Return list of all owners"
        get do
          authenticate!
          Owner.all
        end

        params do
          requires :token, type: String, desc: "Access token."
          # requires :index, type: String, desc: "Index."
        end
        desc "Return one owners"
        get '/:id' do
          authenticate!
          Owner.find(params[:id])
        end
      end

    end
  end
end
