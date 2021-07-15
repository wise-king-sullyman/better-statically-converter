Rails.application.routes.draw do
  root "link_builders#new"

  resources :link_builders, only: %i[new create show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
