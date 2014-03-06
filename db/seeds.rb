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

# Create 499 other users
users = 499.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :birthdate  => Date.today - 15.years - rand(20000).days,
                :password   => "password")
end

# Create 100 events
100.times do
  start_time = Time.now + (rand(61) - 30).days
  end_time   = start_time + (1 + rand(6)).hours

  Event.create!( :user_id    => users[rand(users.length)].id,
                 :name       => Faker::Company.name,
                 :location   => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
                 :starts_at  => start_time,
                 :ends_at    => end_time )
end
