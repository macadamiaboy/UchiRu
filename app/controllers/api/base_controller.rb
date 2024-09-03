module Api
  class BaseController < ApplicationController
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :not_authorized

    skip_before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
    before_action :authenticate_with_api_key

    attr_reader :current_bearer, :current_api_key

    def pundit_user
      current_api_key
    end

    protected
    def not_authorized
      render status: :unauthorized, json: {
        errors: ["You're not authorized to perform this action"]
      }
    end

    def authenticate_with_api_key
      authenticate_or_request_with_http_token do |token, options|
        @current_api_key = ApiKey.find_by_token(token)
        @current_bearer = current_api_key&.bearer
      end
    end

    def request_http_token_authentication(realm = "Application", message = nil)
      json_response = { errors: [message || "Access denied"] }
      headers["WWW-Authenticate"] = %(Bearer realm="#{realm.tr('"', "")}")
      render json: json_response, status: :unauthorized
    end

  end
end