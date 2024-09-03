require 'rails_helper'

RSpec.describe PurchaseOption, type: :model do
  describe 'Associations' do
    it 'has many purchases and nullifies them when deleted' do
      association = described_class.reflect_on_association(:purchases)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :nullify
    end

    it 'has and belongs to many movies' do
      association = described_class.reflect_on_association(:movies)
      expect(association.macro).to eq :has_and_belongs_to_many
      expect(association.options[:join_table]).to eq 'movies_purchase_options'
    end

    it 'has and belongs to many seasons' do
      association = described_class.reflect_on_association(:seasons)
      expect(association.macro).to eq :has_and_belongs_to_many
      expect(association.options[:join_table]).to eq 'seasons_purchase_options'
    end
  end

  describe 'Validations' do
    let(:purchase_option) { build(:purchase_option) }

    it 'validates presence of video quality' do
      purchase_option.video_quality = nil
      expect(purchase_option).not_to be_valid
      expect(purchase_option.errors[:video_quality]).to include("can't be blank")
    end

    it 'validates inclusion of video quality in allowed values' do
      purchase_option.video_quality = "4K"
      expect(purchase_option).not_to be_valid
      expect(purchase_option.errors[:video_quality]).to include("4K is not a valid video quality")
    end

    it 'validates presence of price' do
      purchase_option.price = nil
      expect(purchase_option).not_to be_valid
      expect(purchase_option.errors[:price]).to include("can't be blank")
    end

    it 'validates numericality of price and ensures it is greater than 0' do
      purchase_option.price = 0
      expect(purchase_option).not_to be_valid
      expect(purchase_option.errors[:price]).to include("must be greater than 0")
    end

    it 'validates uniqueness of price scoped to video quality' do
      create(:purchase_option, price: 2.99, video_quality: "HD")
      duplicate_purchase_option = build(:purchase_option, price: 2.99, video_quality: "HD")
      expect(duplicate_purchase_option).not_to be_valid
      expect(duplicate_purchase_option.errors[:price]).to include("and video quality combination already exists")
    end
  end

  describe 'Valid Purchase Option' do
    it 'is valid with valid attributes' do
      purchase_option = build(:purchase_option)
      expect(purchase_option).to be_valid
    end
  end

  describe 'Invalid Purchase Option Scenarios' do
    it 'is not valid with an invalid video quality' do
      purchase_option = build(:purchase_option, video_quality: "4K")
      expect(purchase_option).not_to be_valid
      expect(purchase_option.errors[:video_quality]).to include("4K is not a valid video quality")
    end

    it 'is not valid with a price less than or equal to zero' do
      purchase_option = build(:purchase_option, price: 0)
      expect(purchase_option).not_to be_valid
      expect(purchase_option.errors[:price]).to include("must be greater than 0")
    end

    it 'is not valid with duplicate price and video quality combination' do
      create(:purchase_option, price: 2.99, video_quality: "HD")
      duplicate_purchase_option = build(:purchase_option, price: 2.99, video_quality: "HD")
      expect(duplicate_purchase_option).not_to be_valid
      expect(duplicate_purchase_option.errors[:price]).to include("and video quality combination already exists")
    end
  end
end
