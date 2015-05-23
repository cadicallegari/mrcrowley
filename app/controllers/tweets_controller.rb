class TweetsController < ApplicationController

  respond_to :html

  def index
    @tweets = Tweet.all
    respond_with(@tweets)
  end

  def show
    respond_with(@tweet)
  end

  private

  # def tweet_params
  #   params.require(:tweet).permit(:name, :license_id, :state_id)
  # end
end
