class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  belongs_to_active_hash :favorite_car

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end

  validates :nickname, presence: true
  validates :password, length: { minimum: 8 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :favorite_car_id, numericality: { other_than: 1, message: 'を選択してください'}
end
