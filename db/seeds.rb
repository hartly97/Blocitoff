require 'faker'

3.times do
  u = User.new(
    email:    Faker::Internet.safe_email,
    password: "password"
  )
  u.skip_confirmation!
  u.save!
end

user = User.all


5.times do
 Item.create!(
    name:  Faker::Hipster.sentence(3),
    user: user.sample
  )
end

i = Item.last #make sure an item is loaded
i.update_attributes(created_at: i.created_at - 3.days)

items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} Items created"
