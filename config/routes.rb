Rails.application.routes.draw do
  devise_for :users
  resources :companies
  root 'staticpages#home'

  get 'staticpages/home'

  get 'staticpages/help'

  get 'staticpages/tour'

  get 'staticpages/about'

  get 'static/pages'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
