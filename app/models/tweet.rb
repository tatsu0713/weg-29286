class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  belongs_to_active_hash :brand
  belongs_to_active_hash :type
  belongs_to_active_hash :model_year
  has_one_attached :image


  validates :title, presence: true
  validates :caption, presence: true
  validates :image, presence: { message: 'を選択してください'}

  validates :brand_id, :type_id, :model_year_id, numericality: { other_than: 1, message: 'を選択してください'}
end
