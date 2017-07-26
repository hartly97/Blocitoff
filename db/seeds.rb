require 'faker'

3.times do
  u = User.new(
    email:    Faker::Internet.safe_email,
    password: "password",
    name: Faker::Hipster.sentence(1)
  )
  u.skip_confirmation!
  u.save!
end

users = User.all


5.times do
 Item.create!(
    name:  Faker::Hipster.sentence(3),
    user: users.sample
  )
end

#i = Item.last #make sure an item is loaded
#i.update_attributes(created_at: i.created_at - 3.days)

items = Item.all

items.each do |i|
  i.update_attributes(created_at: i.created_at - rand(1..7).days)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} Items created"
