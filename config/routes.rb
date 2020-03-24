Rails.application.routes.draw do

  devise_for :users
  root to: "questions#index"

  concern :votable do
    member do
      post :voteup
      post :votedown
    end
  end

  resources :questions, concerns: :votable do
    resources :answers, shallow: true, except: :index, concerns: :votable do
      member do
        post :best
      end
    end
  end

  resources :users do
    resources :badges, only: %i[index]
  end

  resources :attachments, only: :destroy
end
