class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(created_at: :asc)
  end

  def new
  end

  def create
    fetched_tweets = tweet_fetcher.fetch(params[:user], count: params[:count])

    if fetched_tweets.count > 0
      redirect_to tweets_path
    else
      render :new
    end
  end

  private

  def tweet_fetcher
    @tweet_fetcher ||= TweetFetcher.new(current_user)
  end
end
