Rails.application.routes.draw do
  resources :projects do
    member do
      put "like" => "projects#like"
    end
  end
  resources :courses
  devise_for :users, :controllers => { registrations: "registrations" }
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "courses#index"
end
