class Api::V1::ProfilesController < ApplicationController
  before_action :doorkeeper_authorize!
  respond_to :json
  def show
  end
end
