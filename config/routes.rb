Rails.application.routes.draw do

  devise_for :users
  root to: "questions#index"

  resources :questions do
    member do
      delete :destroy_attached_file
    end

    resources :answers, shallow: true, except: :index do
      member do
        post :best
        delete :destroy_attached_file
      end
    end
  end

  resources :attachments, only: :destroy
end
