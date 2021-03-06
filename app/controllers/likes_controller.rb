class LikesController < ApplicationController
  # before_action :set_tweet, only: [:create, :destroy]

  # def create
  #   @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
  # end

  # def destroy
  #   like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
  #   like.destroy
  # end

  # private

  # def set_tweet
  #   @tweet = Tweet.find(params[:tweet_id])
  # end

  before_action :set_tweet, only: [:create, :destroy]
  def create
    @like = current_user.likes.create(like_params)

    respond_to do |format|
      format.html { redirect_to @tweet }
      format.js
    end
  end

  def destroy
    @like = Like.find_by(like_params, user_id: current_user.id)
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @tweet }
      format.js
    end
  end

  private
  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
  def like_params
    params.permit(:tweet_id)
  end
  
end
