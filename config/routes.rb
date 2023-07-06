
Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  
  resources :products
  resources :welcome, only: [:index]

  root "welcome#index"
end
