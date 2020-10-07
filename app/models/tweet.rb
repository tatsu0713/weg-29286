class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :brand
  belongs_to_active_hash :type
  belongs_to_active_hash :model_year
  has_one_attached :image
  has_many :likes, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id )
  end


  validates :title, presence: true
  validates :caption, presence: true
  validates :image, presence: { message: 'を選択してください'}

  validates :brand_id, :type_id, :model_year_id, numericality: { other_than: 1, message: 'を選択してください'}
end
