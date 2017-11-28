Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "caseworkers#sign_in"
  resources :boards
  resources :clients do
    collection do
      get :recent
    end
  end
  resources :caseworkers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
