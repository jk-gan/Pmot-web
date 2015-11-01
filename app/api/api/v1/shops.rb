module API
  module V1
    class Shops < Grape::API
      version 'v1'
      format :json

      resource :shops do
        desc "Return list of shops"
        get do
          Shop.all
        end
      end
    end
  end
end
