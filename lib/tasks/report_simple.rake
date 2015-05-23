namespace :report do
  desc "simpe report"
  task :simple => :environment do
    puts "Tweets: #{Tweet.count} Users: #{User.count}"
  end
end
