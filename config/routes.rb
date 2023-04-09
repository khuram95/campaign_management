Rails.application.routes.draw do
  root 'campaigns#index'
  devise_for :users,
  controllers: {
   registrations: "users/registrations",
   sessions: "users/sessions"
 }
 resources :campaigns
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
