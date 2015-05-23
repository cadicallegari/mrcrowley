require 'rubygems'
require 'tweetstream'
require 'httparty'
require 'dotenv'

Dotenv.load

TweetStream.configure do |config|
  config.consumer_key       = ENV['CONSUMER_KEY']
  config.consumer_secret    = ENV['CONSUMER_SECRET']
  config.oauth_token        = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
  config.auth_method        = :oauth
end
URL = 'http://localhost:3000/api/v1/tweets'


def parser_tweet(raw_tweet)
  tweet = {
    :created_at => raw_tweet.created_at,
    :id_str => raw_tweet.id,
    :text => raw_tweet.text,
    :user => {
      :id_str => raw_tweet.user.id,
      :name => raw_tweet.user.name,
      :screen_name => raw_tweet.user.screen_name,
      :created_at => raw_tweet.user.created_at,
    }

  }
  tweet
end

def send_tweet(tweet)
  HTTParty.post(URL, body: parser_tweet(tweet))
end

words = []
ARGV.each do |arg|
  words << arg
end

TweetStream::Client.new.track(words) do |status|
  puts "#{status.text}"
  send_tweet(status)
end
