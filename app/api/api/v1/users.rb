module API
  module V1
    class Users < Grape::API
      version 'v1'
      format :json

      resource :users do
        params do
          requires :token, type: String, desc: "Access token."
        end
        desc "Return list of all users"
        get do
          authenticate!
          User.all
        end

        params do
          requires :token, type: String, desc: "Access token."
          # requires :index, type: String, desc: "Index."
        end
        desc "Return one user"
        get '/:id' do
          authenticate!
          User.find(params[:id])
        end

        params do
          requires :user, type: Hash do
            requires :name, type: String
            requires :email, type: String
            requires :password, type: String
            requires :password_confirmation, type: String
          end
        end
        post :new do
          # params[:user].inspect
          user = User.new(
              name:                       params[:user][:name],
              email:                      params[:user][:email],
              password:                   params[:user][:password],
              password_confirmation:      params[:user][:password_confirmation]
            )
          if user.save
            user
          else
            user
          end
        end
      end
    end
  end
end
