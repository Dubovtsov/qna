require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should belong_to :linkable }

  it { should validate_presence_of :name }
  it { should validate_presence_of :url }

  it { is_expected.to validate_url_of(:url) }

  describe 'validate url' do
    let(:question) { create(:question) }
    let!(:valid_url) { build(:link, url: 'http://google.com/', linkable: question) }
    let!(:invalid_url) { build(:link, url: 'some_invalid_url', linkable: question) }

    it { expect(valid_url).to be_valid }
    it { expect(invalid_url).to be_invalid }

    it do
      invalid_url.validate
      expect(invalid_url.errors[:url]).to include('is not a valid URL')
    end
  end

  describe 'Link#gist?' do
    let!(:gist_link) { build(:link, url: 'https://gist.github.com/Dubovtsov/b1b4d2310cec6264d315d057cb4e223a') }
    let!(:google_link) { build(:link, url: 'http://google.com/') }

    it { expect(gist_link).to be_is_gist }
    it { expect(google_link).to_not be_is_gist }
  end

  describe 'Link#gist' do
    let!(:gist_link) { build(:link, url: 'https://gist.github.com/Dubovtsov/b1b4d2310cec6264d315d057cb4e223a') }

    it { expect(gist_link.show_gist).to be_a_kind_of Array }
    it { expect(gist_link.show_gist.first).to include(content: 'class User', name: 'gistfile1.txt') }
  end
end
