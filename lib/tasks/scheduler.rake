#desc "This task is called by the Heroku scheduler add-on"
#task delete_items: => :environment do
#  Item.where("created_at <= ?", Time.now - 7.days).destroy_all
#  puts "Deleting expired items..."
#  delete_items.update
#  puts "done."
#end
