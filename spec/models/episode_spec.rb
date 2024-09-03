require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'Associations' do
    it 'belongs to a season' do
      association = described_class.reflect_on_association(:season)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'Validations' do
    let(:season) { create(:season) }
    let(:episode) { build(:episode, season: season) }

    it 'is valid with valid attributes' do
      expect(episode).to be_valid
    end

    it 'validates presence of title' do
      episode.title = nil
      expect(episode).not_to be_valid
      expect(episode.errors[:title]).to include("can't be blank")
    end

    it 'validates presence of plot' do
      episode.plot = nil
      expect(episode).not_to be_valid
      expect(episode.errors[:plot]).to include("can't be blank")
    end

    it 'validates presence of number' do
      episode.number = nil
      expect(episode).not_to be_valid
      expect(episode.errors[:number]).to include("can't be blank")
    end

    it 'validates that number is an integer' do
      episode.number = 'one'
      expect(episode).not_to be_valid
      expect(episode.errors[:number]).to include("is not a number")
    end

    it 'validates that number is greater than zero' do
      episode.number = 0
      expect(episode).not_to be_valid
      expect(episode.errors[:number]).to include("must be greater than 0")
    end

    it 'validates presence of a season' do
      episode.season = nil
      expect(episode).not_to be_valid
      expect(episode.errors[:season]).to include("must exist")
    end
  end

  describe 'Valid Episode' do
    it 'is valid with valid attributes' do
      season = create(:season)
      episode = build(:episode, season: season)
      expect(episode).to be_valid
    end
  end

  describe 'Invalid Episode Scenarios' do
    it 'is not valid without a title' do
      episode = build(:episode, title: nil)
      expect(episode).not_to be_valid
      expect(episode.errors[:title]).to include("can't be blank")
    end

    it 'is not valid without a plot' do
      episode = build(:episode, plot: nil)
      expect(episode).not_to be_valid
      expect(episode.errors[:plot]).to include("can't be blank")
    end

    it 'is not valid without a number' do
      episode = build(:episode, number: nil)
      expect(episode).not_to be_valid
      expect(episode.errors[:number]).to include("can't be blank")
    end

    it 'is not valid with a non-integer number' do
      episode = build(:episode, number: 'one')
      expect(episode).not_to be_valid
      expect(episode.errors[:number]).to include("is not a number")
    end

    it 'is not valid with a number less than or equal to zero' do
      episode = build(:episode, number: 0)
      expect(episode).not_to be_valid
      expect(episode.errors[:number]).to include("must be greater than 0")
    end

    it 'is not valid without a season' do
      episode = build(:episode, season: nil)
      expect(episode).not_to be_valid
      expect(episode.errors[:season]).to include("must exist")
    end
  end
end
