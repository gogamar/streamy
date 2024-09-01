class User < ApplicationRecord
  # for the sake of testing we will destroy purchases if we need to destroy users
  has_many :purchases, dependent: :destroy
  has_many :purchase_options, through: :purchases

  validates :email, presence: true, uniqueness: true

  def active_purchase_exists?(content_id, content_type)
    purchases.where(content_id: content_id, content_type: content_type)
             .where('expiration_time > ?', Time.current)
             .exists?
  end
end
