class Api::V1::TeamsController < ApplicationController
    before_action :doorkeeper_authorize!
end
