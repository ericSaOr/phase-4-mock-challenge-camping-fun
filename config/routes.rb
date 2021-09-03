Rails.application.routes.draw do
  resources :signups
  resources :activities
  resources :campers, include: [:index, :show, :create]

end
