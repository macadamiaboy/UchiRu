class ApiKeysController < ApplicationController
  def create
    @api_key = ApiKey.new(bearer: current_user)
    if @api_key.save
      redirect_to schools_path
    else
      render status: :unprocessable_entity, json: {
        errors: @api_key.errors.full_messages
      }
    end
  end
end
