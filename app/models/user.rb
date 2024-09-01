class User < ApplicationRecord
  has_many :purchases, dependent: :destroy
  validates :email, presence: true, uniqueness: true

  def active_purchases
    purchases
      .where('expiration_time > ?', Time.current)
      .includes(content: :episodes)
      .order(:expiration_time)
  end

  def active_purchase?(content)
    active_purchases.where(
      content_id: content.id,
      content_type: content.class.name
    ).exists?
  end
end
