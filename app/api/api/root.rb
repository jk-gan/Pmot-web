module API
  class Root < Grape::API
    prefix :api
    error_formatter :json, API::ErrorFormatter

    # http_basic do |email, password|
    #   user = Owner.find_by_email(email)
    #   user && user.valid_password?(password)
    # end

    helpers do
      def authenticate!
        error!('Unauthorized. Invalid or expired token.', 401) unless current_user
      end

      def current_user
        # find token. Check if valid.
        token = ApiKey.where(access_token: params[:token]).first
        if token && !token.expired?
          @current_user = User.find(token.user_id)
        else
          false
        end
      end
    end

    mount API::V1::Root





    # helpers do
    #   def authenticate!
    #     error!('Unauthorized. Invalid or expired token.', 401) unless current_user
    #   end
    #
    #   def current_user
    #     # find token. Check if valid.
    #     token = ApiKey.where(access_token: params[:token]).first
    #     if token && !token.expired?
    #       @current_user = Owner.find(token.user_id)
    #     else
    #       false
    #     end
    #   end
    # end
    #
    #
    # resource :auth do
    #
    # desc "Creates and returns access_token if valid login"
    #   params do
    #     requires :login, type: String, desc: "Username or email address"
    #     requires :password, type: String, desc: "Password"
    #   end
    #   post :login do
    #
    #     if params[:login].include?("@")
    #       user = User.find_by_email(params[:login].downcase)
    #     else
    #       user = User.find_by_login(params[:login].downcase)
    #     end
    #
    #     if user && user.authenticate(params[:password])
    #       key = ApiKey.create(user_id: user.id)
    #       {token: key.access_token}
    #     else
    #       error!('Unauthorized.', 401)
    #     end
    #   end
    #
    #   desc "Returns pong if logged in correctly"
    #   params do
    #     requires :token, type: String, desc: "Access token."
    #   end
    #   get :ping do
    #     authenticate!
    #     { message: "pong" }
    #   end
    # end

  end
end
