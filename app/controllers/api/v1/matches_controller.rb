class Api::V1::MatchesController < ApplicationController
  before_action :doorkeeper_authorize!
end
