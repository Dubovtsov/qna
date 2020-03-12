require 'rails_helper'

RSpec.describe Badge, type: :model do
  let(:question) { create(:question) }

  it { should validate_presence_of :name }
  it { should belong_to(:question) }
  it { should belong_to(:user) }

  it 'have one attached image' do
    expect(Badge.new.image).to be_an_instance_of(ActiveStorage::Attached::One)
  end

  it 'validate image presence' do
    expect(Badge.new(name: 'badge name', question: question)).to_not be_valid
    expect(Badge.new(name: 'badge name', question: question, image: fixture_file_upload("#{Rails.root}/spec/rails_helper.rb", 'text/plain'))).to_not be_valid
    expect(Badge.new(name: 'badge name', question: question, image: fixture_file_upload("#{Rails.root}/spec/badge.png", 'image/png'))).to be_valid
  end
end
