namespace :report do
  desc "simpe report"
  task :simple => :environment do

    tweets = Tweet.all
    tweets_per_hour = {}

    (0..23).each do |h|
      tweets_per_hour[h] = tweets.collect { |tweet|
        tweet.id if ((tweet.created_at.hour <= h) and (tweet.created_at.hour >= h))
      }.compact.count
    end

    puts "########## Média de tweets por horário"
    tweets_per_hour.each do |key, value|
      puts "#{key.to_s.rjust(2, '0')}:00 = #{value}"
    end

    puts "\n########## Usuário com maior número de tweets"

    group = Tweet.group(:user_id).order('count_id DESC').limit(1).count(:id)

    user_id     = 0
    tweet_count = 0
    group.each do |k, v|
      user_id     = k
      tweet_count = v
    end

    user = User.select(:screen_name).find(user_id)
    puts "@#{user.screen_name} - #{tweet_count} tweets"

  end
end
