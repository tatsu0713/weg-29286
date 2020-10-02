class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end





  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def tweet_params
    params.permit(:brand_id, :type_id, :model_year_id, :title, :caption, :image).merge(user_id: current_user.id)
  end

end