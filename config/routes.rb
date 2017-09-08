Rails.application.routes.draw do
  resources :crmings
  resources :crms
  resources :addressings
  resources :addresses
  resources :orgings
  resources :orgs
  resources :urlings
  resources :urls
  resources :phonings
  resources :phones
  resources :contacts
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
