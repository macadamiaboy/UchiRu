module Api
  class ApiKeyPolicy < BasePolicy
    def show?
      api_key.bearer.is_a?(Organization)
    end
  end
end