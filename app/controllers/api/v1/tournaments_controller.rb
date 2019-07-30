class Api::V1::TournamentsController < ApplicationController
    before_action :doorkeeper_authorize!
end
