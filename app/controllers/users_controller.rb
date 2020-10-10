class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @tweets = current_user.tweets
    @user = User.find(params[:id])
    @user = current_user.favorite_car[:name]
    # @tweet = Tweet.find(params[:tweet_id])
  end
end
