require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Associations' do
    it 'has and belongs to many purchase_options' do
      association = described_class.reflect_on_association(:purchase_options)
      expect(association.macro).to eq :has_and_belongs_to_many
      expect(association.options[:join_table]).to eq 'movies_purchase_options'
    end

    it 'has many purchases as content' do
      association = described_class.reflect_on_association(:purchases)
      expect(association.macro).to eq :has_many
      expect(association.options[:as]).to eq :content
    end
  end

  describe 'Validations' do
    let(:movie) { build(:movie) }

    it 'validates presence of title' do
      movie.title = nil
      expect(movie).not_to be_valid
      expect(movie.errors[:title]).to include("can't be blank")
    end

    it 'validates presence of plot' do
      movie.plot = nil
      expect(movie).not_to be_valid
      expect(movie.errors[:plot]).to include("can't be blank")
    end
  end

  describe 'Valid Movie' do
    it 'is valid with valid attributes' do
      movie = build(:movie)
      expect(movie).to be_valid
    end
  end

  describe 'Invalid Movie Scenarios' do
    it 'is not valid without a title' do
      movie = build(:movie, title: nil)
      expect(movie).not_to be_valid
      expect(movie.errors[:title]).to include("can't be blank")
    end

    it 'is not valid without a plot' do
      movie = build(:movie, plot: nil)
      expect(movie).not_to be_valid
      expect(movie.errors[:plot]).to include("can't be blank")
    end
  end
end
