require 'rails_helper'

RSpec.describe Match, type: :model do
  # it { should validate_presence_of(:date) }
  it { should validate_presence_of(:tournament) }
  it { should validate_presence_of(:home_team) }
  it { should validate_presence_of(:visit_team) }
  it { should belong_to(:tournament) }
  # describe "home visit teams uniqueness" do
  #   subject { Match.new(date: DateTime.now, home_team: Team.all.sample, visit_team: Team.all.sample, tournament: Tournament.all.sample) }
  #   it { should validate_uniqueness_of(:home_team).scoped_to(:visit_team) }
  # end
end
