class ApplicationController < ActionController::API
  respond_to :json
  include JSONAPI::ActsAsResourceController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :doorkeeper_authorize!, only: [:me]
  before_action :set_current_user, only: [:me]

  def me
    render json: @current_user.as_json
  end

  def set_current_user
    @current_user ||= if doorkeeper_token
                        User.find(doorkeeper_token.resource_owner_id)
                      else
                        warden.authenticate(scope: :user)
                      end
  end

  protected

    def configure_permitted_parameters
      attributes = [:name, :last_name, :username, :email]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
    
  private

    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
end
