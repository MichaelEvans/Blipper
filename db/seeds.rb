# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

require 'faker'
require 'populator'

User.destroy_all


while User.count < 10 do
  user = User.new
  user.username = Faker::Internet.user_name
  user.email = Faker::Internet.email
  user.password = "test"
  user.password_confirmation = "test"
  user.phone_number = Faker::PhoneNumer.phone_number
  user.save
end

User.all.each do |user|
    Blip.populate(5..10) do |blip|
        blip.user_id = user.id
        blip.message = Faker::Lorem.sentence
    end
    3.times do
      user.add_friend(User.all[rand(User.count)])
    end
end