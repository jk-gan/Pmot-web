module API
  module V1
    class Root < Grape::API
      error_formatter :json, API::V1::ErrorFormatter
      mount API::V1::Owners
      mount API::V1::Users
      mount API::V1::Shops
      mount API::V1::Auth
      mount API::V1::Device
      mount API::V1::Promotions
    end
  end
end
