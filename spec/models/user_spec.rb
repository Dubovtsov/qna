require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  describe 'author_of?' do
    let(:user) { create(:user) }
    let(:user_question) { create(:question, user: user) }
    let(:different_user_answer) { create(:answer, question: user_question, user: create(:user)) }

    it { expect(user).to be_author_of(user_question) }
    it { expect(user).to_not be_author_of(different_user_answer) }
  end
end
