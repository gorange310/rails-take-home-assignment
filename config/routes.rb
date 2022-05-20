Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :portfolios do
    member do
      patch :up
      patch :down
    end
    resources :stocks
  end
end
