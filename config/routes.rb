Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root to: 'tests#index'
  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
    resources :gists, only: %i[index]
  end
  resources :tests, only: [:index] do
    member do
      post :start
    end
  end
  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end
  resources :contact_messages, only: %i[new create]

end