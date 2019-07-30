# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    name: 'David',
    last_name: 'Cantu',
    username: 'davidcantum',
    email: 'test@test.com', 
    password: 'password', 
    password_confirmation: 'password' 
    )

50.times do
    User.create(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password', 
    password_confirmation: 'password' 
    )
end
Sport.create name: 'American Football'
Sport.create name: 'Baseball'

Tournament.create name: 'National Football League', sport: Sport.first
Tournament.create name: 'Major League Baseball', sport: Sport.second

5.times do
    Group.create name: Faker::FunnyName.name, owner: User.all.sample, tournament: Tournament.first
    group = Group.last
    group.users << Group.last.owner 
    5.times do
        user = User.all.sample
        group.users << user unless group.users.include?(user)
    end
end

50.times do
    Team.create name: Faker::Team.name, abbreviation: Faker::Team.mascot, sport: Sport.all.sample
end

20.times do
    sport = Sport.all.sample
    tournament = sport.tournaments.sample
    Match.create(
        tournament: tournament, 
        home_team: sport.teams.sample, 
        visit_team: sport.teams.sample, 
        date: DateTime.now+(rand(1..10).days)
    )
end

30.times do
    membership = Membership.all.sample
    match = membership.group.tournament.matches.sample
    match_teams = [match.home_team, match.visit_team]
    Pick.create(
        membership: membership,
        match: match,
        picked_team: match_teams.sample # picked team must be either home_team or visit_team
    )
end