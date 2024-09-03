class Movie < ApplicationRecord
  has_and_belongs_to_many :purchase_options, join_table: 'movies_purchase_options'
  has_many :purchases, as: :content

  validates :title, presence: true
  validates :plot, presence: true
end
