require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create :question }
  let!(:answer) { create :answer, question: question }
  let!(:answer) { create :answer, question: question }

  # let!(:question) { Question.create!(title: 'First', body: 'second') }
  # let(:answer) { Answer.create!(body: 'answer', question_id: 1) }

  #
  # describe 'GET #index' do
  #   let(:questions) { create_list(:answer, 3) }
  #
  #   before { get :index }
  #
  #   it 'populates an array of all questions' do
  #     expect(assigns(:questions)).to match_array(questions)
  #   end
  #
  #   it 'renders index view' do
  #     expect(response).to render_template :index
  #   end
  # end
  #
  # describe 'GET #show' do
  #   before { get :show, params: { id: answer } }
  #
  #   it 'assigns the requested answer to @answer' do
  #     expect(assigns(:answer)).to eq answer
  #   end
  #
  #   it 'renders show view' do
  #     expect(response).to render_template :show
  #   end
  # end
  # #
  describe 'GET #new' do
    before { get :new, params: { id: 7, body: '12312', question_id: question.id } }

    it 'assigns a new Answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end
  #
  # describe 'GET #edit' do
  #   before { get :edit, params: { id: answer } }
  #
  #   it 'assigns the requested answer to @answer' do
  #     expect(assigns(:answer)).to eq answer
  #   end
  #
  #   it 'renders edit view' do
  #     expect(response).to render_template :edit
  #   end
  # end

  describe 'POST #create' do

    context 'with valid attributes' do

            # it 'saves a new answer in db' do
            #   expect { post :create, params: { question_id: question, answer: attributes_for(:answer) }, format: :js }.to change(question.answers, :count).by(1)
            # end
            #
            # it 'created answer belongs to current_user' do
            #   post :create, params: { question_id: question, answer: attributes_for(:answer) }, format: :js
            #   expect(assigns(:answer).user).to eq user
            # end
            #
            # it 'redirects to show view' do
            #   post :create, params: { question_id: question, answer: attributes_for(:answer) }, format: :js
            #   expect(response).to render_template :create
            # end

      it 'saves a new answer in the datebase' do
        # byebug
        expect { post :create, params: { question_id: question, answer: attributes_for(:answer) } }.to change(question.answers, :count).by(1)
      end

        # it 'saves a new answer in the datebase' do
        #   expect { post :create, params: { answer: attributes_for(:answer) } }.to change(Answer, :count).by(1)
        # end

        it 'redirects to show view' do
          post :create, params: { question_id: question, answer: attributes_for(:answer) }
          expect(response).to redirect_to assigns(:question)
        end

    end

    # context 'with invalid attributes' do
    #   it 'does not save the answer' do
    #     expect { post :create, params: { answer: attributes_for(:answer, :invalid) } }.to_not change(Answer, :count)
    #   end
    #
    #   it 're-renders new view' do
    #     post :create, params: { answer: attributes_for(:answer, :invalid) }
    #     expect(response).to render_template :new
    #   end
    # end
  end
  #
  # describe 'PATCH #update' do
  #   context 'with valid attributes' do
  #
  #     it 'assigns the requested answer to @answer' do
  #       patch :update, params: { id: answer, answer: attributes_for(:answer) }
  #       expect(assigns(:answer)).to eq answer
  #     end
  #
  #     it 'changes answer attributes' do
  #       patch :update, params: { id: answer, answer: { body: 'new body' } }
  #       answer.reload
  #       expect(answer.body).to eq 'new body'
  #     end
  #
  #     it 'redirects to updated answer' do
  #       patch :update, params: { id: answer, answer: attributes_for(:answer) }
  #       expect(response).to redirect_to answer
  #     end
  #   end
  #
  #   context 'with invalid attributes' do
  #     before { patch :update, params: { id: answer, answer: attributes_for(:answer, :invalid) } }
  #
  #     it 'does not change answer' do
  #       answer.reload
  #
  #       expect(answer.body).to eq 'MyText'
  #     end
  #
  #     it 're-renders edit view' do
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end
  #
  # describe 'DELETE #destroy' do
  #   let!(:answer) { create(:answer) }
  #
  #   it 'delete the answer' do
  #     expect { delete :destroy, params: { id: answer } }.to change(Answer, :count).by(-1)
  #   end
  #
  #   it 'redirect to index' do
  #     delete :destroy, params: { id: answer }
  #     expect(response).to redirect_to question
  #   end
  # end
end
