Rails.application.routes.draw do
    namespace :admin do
      resources :posts do
        resources :comments, only: [:destroy, :show, :update, :edit] 
        end
    end
    resources :posts, only: %i[:index] do
        resources :comments, only: [:index, :create]
        end

  root "posts#index"
end
