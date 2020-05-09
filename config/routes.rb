Rails.application.routes.draw do

  devise_for :users
  root to: "questions#index"

  concern :votable do
    member do
      post :voteup
      post :votedown
    end
  end

  concern :commentable do
    resources :comments, shallow: true, only: :create
  end
  
  resources :questions, concerns: %i[votable commentable] do
    resources :answers, shallow: true, except: :index, concerns: %i[votable commentable] do
      member do
        post :best
      end
    end
  end

  resources :users do
    resources :badges, only: %i[index]
  end

  resources :attachments, only: :destroy

  mount ActionCable.server => '/cable'
end
