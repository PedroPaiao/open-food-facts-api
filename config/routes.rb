
Rails.application.routes.draw do
  root "welcome#index"
  
  namespace :Api do
    namespace :V1 do
      resources :products
    end
  end
end
