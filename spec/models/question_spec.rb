require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should have_many(:answers).dependent(:destroy) }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_length_of(:title).is_at_least(4) }

  it 'have one attached file' do
    expect(Question.new.file).to be_an_instance_of(ActiveStorage::Attached::One)
  end
end
