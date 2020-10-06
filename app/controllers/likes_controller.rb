class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.create(tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end