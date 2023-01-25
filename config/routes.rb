Rails.application.routes.draw do
  root "simulations#new"

  post "create_simulation", to: "simulations#create"
  get "/simulations/:id", to: "simulations#show", as: 'simulation'
  post 'send_email', to: "simulations#send_email"
end
