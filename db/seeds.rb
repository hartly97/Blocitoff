require 'faker'

3.times do
  u = User.new(
    email:    Faker::Internet.safe_email,
    password: "password"
  )
  u.skip_confirmation!
  u.save!
end


5.times do
  Item.create!(
    name:  Faker::Hipster.sentence(3),
    user: users.sample
  )
end

items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} Items created"
