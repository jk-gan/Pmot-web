module API
  module V1
    class Root < Grape::API
      error_formatter :json, API::V1::ErrorFormatter
      mount API::V1::Owners
      mount API::V1::Shops
      mount API::V1::Auth
    end
  end
end
