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
          Owner.first
        end
      end

    end
  end
end
