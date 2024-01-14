Rails.application.routes.draw do
  root "pizzas#index"

  resources :pizzas
  # get 'pizzas/index'
  # get 'pizzas/:id', to: "pizzas#show"

end
