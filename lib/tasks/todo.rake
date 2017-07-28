namespace :todo do
  desc "Delete items older than six days"
  task :delete_items => :environment do
    Item.where("created_at <= ?", Time.now - 6.days).destroy_all
  end
end
