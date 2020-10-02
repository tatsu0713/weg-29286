class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  belongs_to_active_hash :category
  belongs_to_active_hash :tweet_status
  has_one_attached :image


  # validates :title, presence: true
  # validates :caption, presence: true
  validates :image, presence: { message: 'を選択してください'}

  validates :category_id, :tweet_status_id, numericality: { other_than: 1, message: 'を選択してください'}
end
