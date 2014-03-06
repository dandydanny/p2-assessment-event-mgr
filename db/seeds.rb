require 'faker'

User.delete_all
Event.delete_all

# Create myself
User.create!( :first_name  => "Daniel",
              :last_name  => "Lu",
              :email      => "dan@dbc.com",
              :birthdate  => "1982/1/1",
              :password   => "password")

# I create an event
Event.create!(  :user_id    => 1,
                :name       => "Code and Beer",
                :location   => "Daniel's apartment",
                :starts_at  => "2014/3/8 10AM",
                :ends_at  => "2014/3/8 2PM")

Event.create!(  :user_id    => 1,
                :name       => "Costume Party",
                :location   => "Office apartment",
                :starts_at  => "2014/3/9 7PM",
                :ends_at  => "2014/3/9 11PM")

# Create 5 other users
users = 5.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :birthdate  => Date.today - 15.years - rand(20000).days,
                :password   => "password")
end

# Create 10 events
10.times do
  start_time = Time.now + (rand(61) - 30).days
  end_time   = start_time + (1 + rand(6)).hours

  Event.create!( :user_id    => users[rand(users.length)].id,
                 :name       => Faker::Company.name,
                 :location   => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
                 :starts_at  => start_time,
                 :ends_at    => end_time )
end

# Have some user attend some events
  User.first.attended_events << Event.find(2)
6.times do
  User.find(rand(1..6)).attended_events << Event.find(rand(1..10))
end
