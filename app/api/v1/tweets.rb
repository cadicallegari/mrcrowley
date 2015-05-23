module API
  module V1
    class Tweets < Grape::API
      version 'v1', using: :path
      format          :json
      default_format  :json
      formatter :json, Grape::Formatter::Rabl

      resource :tweets do


        post '', :rabl => "v1/tweets/all.rabl" do
          puts params.to_json
          @tweet      = TweetParser.parser(params)

          user = User.where(id_str: params[:user][:id]).first
          if user.nil?
            user = UserParser.parser(params[:user])
            user.save
          end

          puts user.to_json
          @tweet.user = user

          if @tweet.valid?
            @tweet.save
          else
            puts @tweet.errors.full_messages
            error!(@tweet.errors.full_messages, 401)
          end
        end

      end

    end
  end
end
