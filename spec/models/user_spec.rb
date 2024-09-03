require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it 'has many purchases' do
      association = described_class.reflect_on_association(:purchases)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end
  end

  describe 'Validations' do
    let(:user) { build(:user) }

    it 'validates presence of email' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'validates uniqueness of email' do
      create(:user, email: 'unique@example.com')
      user.email = 'unique@example.com'
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("has already been taken")
    end
  end

  describe '#active_purchases' do
    it 'returns only purchases that have not expired' do
      user = create(:user)
      movie = create(:movie)
      purchase_option = create(:purchase_option)

      past_purchase = create(:purchase, user: user, content: movie, purchase_option: purchase_option, expiration_time: 1.day.ago, content_type: "Movie")

      future_purchase = create(:purchase, user: user, content: movie, purchase_option: purchase_option, expiration_time: 2.days.from_now, content_type: "Movie")

      expect(user.active_purchases).to include(future_purchase)
      expect(user.active_purchases).not_to include(past_purchase)
    end
  end

  describe '#active_purchase?' do
    let(:user) { create(:user) }
    let(:movie) { create(:movie) }
    let(:purchase_option) { create(:purchase_option) }

    it 'returns true if the user has an active purchase for the given content' do
      create(:purchase, user: user, content: movie, purchase_option: purchase_option, expiration_time: 2.days.from_now)

      expect(user.active_purchase?(movie)).to be_truthy
    end

    it 'returns false if the user does not have an active purchase for the given content' do
      create(:purchase, user: user, content: movie, purchase_option: purchase_option, expiration_time: 2.days.ago)

      expect(user.active_purchase?(movie)).to be_falsey
    end
  end
end
