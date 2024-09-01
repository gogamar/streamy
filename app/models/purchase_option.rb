class PurchaseOption < ApplicationRecord
  has_and_belongs_to_many :movies, join_table: 'movies_purchase_options'
  has_and_belongs_to_many :seasons, join_table: 'seasons_purchase_options'

  VIDEO_QUALITIES = ["HD", "SD"].freeze
  validates :video_quality, inclusion: { in: VIDEO_QUALITIES, message: "%{value} is not a valid video quality" }

  validates :price, uniqueness: { scope: :video_quality, message: "and video quality combination already exists" }
end
