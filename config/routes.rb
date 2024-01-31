Rails.application.routes.draw do
  root "pizzas#index"

  resources :pizzas 
  
  resources :ingredients
  # get 'pizzas/index'
  # get 'pizzas/:id', to: "pizzas#show"

end
