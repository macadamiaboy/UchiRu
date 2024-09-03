module Api
  module V1
    class ApiKeysController < BaseController
      def show
        authorize([:api, current_api_key])

        render json: {
          id: current_api_key.id,
          bearer_type: current_api_key.bearer_type,
          bearer_id: current_api_key.bearer_id
        }
      end
    end
  end
end