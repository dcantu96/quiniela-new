class Api::V1::SportsController < ApplicationController
    before_action :doorkeeper_authorize!
end
