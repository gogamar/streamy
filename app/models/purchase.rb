class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option
  belongs_to :content, polymorphic: true

  validates :price, presence: true
  validates :video_quality, presence: true
  validates :expiration_time, presence: true
  validates :user_id, presence: true
  validates :content_type, presence: true
  validates :content_id, presence: true

  validate :disallow_duplicate_purchase, on: :create

  private

  def disallow_duplicate_purchase
    if user.active_purchase?(content)
      errors.add(:base, 'You have already purchased this content.')
    end
  end
end
