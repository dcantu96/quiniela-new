class Api::V1::MembershipsController < ApplicationController
    before_action :doorkeeper_authorize!
end
