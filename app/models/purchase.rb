class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option
  belongs_to :content, polymorphic: true

  validate :disallow_duplicate_purchase, on: :create

  private

  def disallow_duplicate_purchase
    if user.active_purchase_exists?(content_id, content_type)
      errors.add(:base, 'You have already purchased this content.')
    end
  end
end
