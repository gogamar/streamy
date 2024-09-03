require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'Associations' do
    it 'has many episodes' do
      association = described_class.reflect_on_association(:episodes)
      expect(association.macro).to eq :has_many
    end

    it 'has and belongs to many purchase_options' do
      association = described_class.reflect_on_association(:purchase_options)
      expect(association.macro).to eq :has_and_belongs_to_many
      expect(association.options[:join_table]).to eq 'seasons_purchase_options'
    end

    it 'has many purchases as content' do
      association = described_class.reflect_on_association(:purchases)
      expect(association.macro).to eq :has_many
      expect(association.options[:as]).to eq :content
    end
  end

  describe 'Validations' do
    let(:season) { build(:season) }

    it 'validates presence of title' do
      season.title = nil
      expect(season).not_to be_valid
      expect(season.errors[:title]).to include("can't be blank")
    end

    it 'validates presence of plot' do
      season.plot = nil
      expect(season).not_to be_valid
      expect(season.errors[:plot]).to include("can't be blank")
    end

    it 'validates presence of number' do
      season.number = nil
      expect(season).not_to be_valid
      expect(season.errors[:number]).to include("can't be blank")
    end

    it 'validates numericality of number as an integer greater than 0' do
      season.number = 'one'
      expect(season).not_to be_valid
      expect(season.errors[:number]).to include("is not a number")

      season.number = 0
      expect(season).not_to be_valid
      expect(season.errors[:number]).to include("must be greater than 0")
    end
  end

  describe 'Valid Season' do
    it 'is valid with valid attributes' do
      season = build(:season)
      expect(season).to be_valid
    end
  end

  describe 'Invalid Season Scenarios' do
    it 'is not valid without a title' do
      season = build(:season, title: nil)
      expect(season).not_to be_valid
      expect(season.errors[:title]).to include("can't be blank")
    end

    it 'is not valid without a plot' do
      season = build(:season, plot: nil)
      expect(season).not_to be_valid
      expect(season.errors[:plot]).to include("can't be blank")
    end

    it 'is not valid without a number' do
      season = build(:season, number: nil)
      expect(season).not_to be_valid
      expect(season.errors[:number]).to include("can't be blank")
    end

    it 'is not valid with a non-integer number' do
      season = build(:season, number: "one")
      expect(season).not_to be_valid
      expect(season.errors[:number]).to include("is not a number")
    end

    it 'is not valid with a number less than or equal to zero' do
      season = build(:season, number: 0)
      expect(season).not_to be_valid
      expect(season.errors[:number]).to include("must be greater than 0")
    end
  end
end
