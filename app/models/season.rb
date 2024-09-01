class Season < ApplicationRecord
  has_many :episodes
  has_and_belongs_to_many :purchase_options, join_table: 'seasons_purchase_options'
  has_many :purchases, as: :content
end
