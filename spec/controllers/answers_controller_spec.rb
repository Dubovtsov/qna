require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }
  let(:answer) { create(:answer, question: question, user: user) }

  describe 'POST #create' do
    before { sign_in(user) }

    context 'with valid attributes' do
      it 'saves a new answer in the datebase' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer) }, format: :js }.to change(question.answers, :count).by(1)
      end

      it 'saves current user as author' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer) }, format: :js }.to change(user.answers, :count).by(1)
      end

      it 'redirects to questions#show view' do
        post :create, params: { question_id: question, answer: attributes_for(:answer) }, format: :js
        expect(response).to render_template :create
      end
    end

    context 'with invalid attributes' do
      it 'does not save the answer' do
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer, :invalid) }, format: :js }.to_not change(Answer, :count)
      end

      it 'renders new view' do
        post :create, params: { question_id: question, user: user, answer: attributes_for(:answer, :invalid) }, format: :js
        expect(response).to render_template :create
      end
    end
  end

  describe 'DELETE #destroy' do
    before { sign_in(user) }

    context 'user is author' do
      let!(:answer) { create(:answer, user: user, question: question) }

      it 'delete the answer' do
        expect { delete :destroy, params: { id: answer }, format: :js }.to change(Answer, :count).by(-1)
      end

      it 'render destroy' do
        delete :destroy, params: { id: answer }, format: :js
        expect(response).to render_template :destroy
      end
    end

    context 'user is not author' do
      let!(:answer) { create(:answer, user: create(:user), question: question) }

      it "user cannot delete someone else's answer" do
        expect { delete :destroy, params: { id: answer }, format: :js }.to_not change(Answer, :count)
      end

      it 'render destroy' do
        delete :destroy, params: { id: answer }, format: :js
        expect(response).to render_template :destroy
      end
    end
  end

  describe 'PATCH #update' do
    before { sign_in(user) }

    context 'with valid attributes' do
      it 'changes answer attributes' do
        patch :update, params: { id: answer, answer: { body: 'new body' } }, format: :js
        answer.reload
        expect(answer.body).to eq 'new body'
      end

      it 'renders update view' do
        patch :update, params: { id: answer, answer: { body: 'new body' } }, format: :js
        answer.reload
        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      it 'does not change answer attributes' do
        expect do
          patch :update, params: { id: answer, answer: attributes_for(:answer, :invalid) }, format: :js
          answer.reload
        end.to_not change(answer, :body)
      end

      it 'renders update view' do
        patch :update, params: { id: answer, answer: attributes_for(:answer, :invalid) }, format: :js
        answer.reload
        expect(response).to render_template :update
      end
    end

    context 'user is not author' do
      let(:user1) { create(:user) }
      before { sign_in(user1) }

      it "user can't edit someone else's answer" do
        patch :update, params: { id: answer, answer: {body: 'new body'} }, format: :js
        answer.reload
        expect(answer.body).to_not eq 'new body'
      end

      it 'renders update view' do
        patch :update, params: { id: answer, answer: {body: 'new body'} }, format: :js
        answer.reload
        expect(response).to render_template :update
      end
    end
  end

  describe 'POST #best' do
    before { sign_in(user) }

    context 'user is author question' do
      it 'changes answer attributes' do
        post :best, params: { id: answer }, format: :js
        answer.reload
        expect(answer.best).to eq true
      end

      it 'renders best view' do
        post :best, params: { id: answer }, format: :js
        answer.reload
        expect(response).to render_template :best
      end
    end

    context 'user is not author of the question' do
      let(:user1) { create(:user) }
      before { sign_in(user1) }

      it "can't set the answer as the best" do
        post :best, params: { id: answer }, format: :js
        expect(answer.reload).to_not be_best
      end

      it 'render best' do
        post :best, params: { id: answer }, format: :js
        answer.reload
        expect(response).to render_template :best
      end
    end
  end
end
