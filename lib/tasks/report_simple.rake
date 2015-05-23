namespace :report do
  desc "simpe report"
  task :simple => :environment do
    puts "Tweets: #{Tweet.count} Users: #{User.count}"

    tweets = Tweet.all
    tweets_per_hour = {}

    (0..23).each do |h|
      tweets_per_hour[h] = tweets.collect { |tweet|
        tweet.id if tweet.created_at.hour <= h and tweet.created_at.hour >= h
      }.compact.count
    end

    puts "########## Tweets por hora"
    tweets_per_hour.each do |key, value|
      puts "#{key.to_s.rjust(2, '0')}:00 = #{value}"
    end

  end
end
