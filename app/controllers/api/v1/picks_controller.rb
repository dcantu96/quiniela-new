class Api::V1::PicksController < ApplicationController
    before_action :doorkeeper_authorize!
end
