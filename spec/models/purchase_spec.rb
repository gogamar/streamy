require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'Associations' do
    it 'belongs to user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to purchase_option' do
      association = described_class.reflect_on_association(:purchase_option)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to content' do
      association = described_class.reflect_on_association(:content)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'Validations' do
    let(:purchase) { build(:purchase) }

    it 'validates presence of price' do
      purchase.price = nil
      expect(purchase).not_to be_valid
      expect(purchase.errors[:price]).to include("can't be blank")
    end

    it 'validates presence of video_quality' do
      purchase.video_quality = nil
      expect(purchase).not_to be_valid
      expect(purchase.errors[:video_quality]).to include("can't be blank")
    end

    it 'validates presence of expiration_time' do
      purchase.expiration_time = nil
      expect(purchase).not_to be_valid
      expect(purchase.errors[:expiration_time]).to include("can't be blank")
    end

    it 'validates presence of user_id' do
      purchase.user_id = nil
      expect(purchase).not_to be_valid
      expect(purchase.errors[:user_id]).to include("can't be blank")
    end

    it 'validates presence of content_type' do
      purchase.content_type = nil
      expect(purchase).not_to be_valid
      expect(purchase.errors[:content_type]).to include("can't be blank")
    end

    it 'validates presence of content_id' do
      purchase.content_id = nil
      expect(purchase).not_to be_valid
      expect(purchase.errors[:content_id]).to include("can't be blank")
    end
  end

  describe 'Valid Purchase' do
    it 'is valid with valid attributes' do
      user = create(:user)
      content = create(:movie)
      purchase_option = create(:purchase_option)

      purchase = build(:purchase, user: user, content: content, purchase_option: purchase_option)
      expect(purchase).to be_valid
    end
  end

  describe 'Invalid Purchase Scenarios' do
    it 'is not valid without a price' do
      purchase = build(:purchase, price: nil)
      expect(purchase).not_to be_valid
      expect(purchase.errors[:price]).to include("can't be blank")
    end

    it 'is not valid without a video quality' do
      purchase = build(:purchase, video_quality: nil)
      expect(purchase).not_to be_valid
      expect(purchase.errors[:video_quality]).to include("can't be blank")
    end

    it 'is not valid without an expiration time' do
      purchase = build(:purchase, expiration_time: nil)
      expect(purchase).not_to be_valid
      expect(purchase.errors[:expiration_time]).to include("can't be blank")
    end
  end

  describe 'Custom validation: Disallow duplicate purchase' do
    let(:user) { create(:user) }
    let(:movie) { create(:movie) }
    let!(:existing_purchase) { create(:purchase, user: user, content: movie) }

    it 'is not valid if the user already has an active purchase for the content' do
      allow(user).to receive(:active_purchase?).with(movie).and_return(true)
      new_purchase = build(:purchase, user: user, content: movie)

      expect(new_purchase).to_not be_valid
      expect(new_purchase.errors[:base]).to include('You have already purchased this content.')
    end

    it 'is valid if the user does not have an active purchase for the content' do
      allow(user).to receive(:active_purchase?).with(movie).and_return(false)
      new_purchase = build(:purchase, user: user, content: movie)

      expect(new_purchase).to be_valid
    end
  end
end
