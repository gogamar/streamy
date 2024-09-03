class Season < ApplicationRecord
  has_many :episodes, dependent: :destroy
  has_and_belongs_to_many :purchase_options, join_table: 'seasons_purchase_options'
  has_many :purchases, as: :content

  validates :title, presence: true
  validates :plot, presence: true
  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
