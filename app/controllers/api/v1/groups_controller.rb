class Api::V1::GroupsController < ApplicationController
  before_action :doorkeeper_authorize!
end
