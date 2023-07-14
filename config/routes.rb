Rails.application.routes.draw do
    namespace :admin do
      resources :posts do
        resources :comments, only: [:destroy, :index, :update, :edit] 
        end
    end
    resources :posts, only: [:index, :show] do
        resources :comments, except: [:destroy, :update, :edit, :new, :show]  
        end

  root "posts#index"
end
