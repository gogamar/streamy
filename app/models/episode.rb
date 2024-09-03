class Episode < ApplicationRecord
  belongs_to :season

  validates :title, presence: true
  validates :plot, presence: true
  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :season, presence: true
end
