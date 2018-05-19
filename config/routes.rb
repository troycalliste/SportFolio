Rails.application.routes.draw do
  devise_for :users

  resources :companies do
    collection do
      get 'events'
    end
  end
  root 'staticpages#home'
  #
  # post 'companies/publish', to: "companies#pub"
  #
  # get 'companies/subscribe', to: "companies#sub"

  get 'staticpages/home'

  get 'staticpages/help'

  get 'staticpages/tour'

  get 'staticpages/about'

  get 'static/pages'

  resources :users do
    resources :trades
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
