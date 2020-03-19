Rails.application.routes.draw do

  devise_for :users
  root to: "questions#index"

  resources :questions do
    resources :answers, shallow: true, except: :index do
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
