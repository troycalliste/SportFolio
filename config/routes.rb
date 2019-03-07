Rails.application.routes.draw do







  resources :examples
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: "devise/sessions", omniauth_callbacks: 'omniauth_callbacks' }
  get 'auth/:provider/callback', to: 'devise/sessions#create'


  get '/', to: "staticpages#home"
  get '/leaderboard', to: "staticpages#leaderboard"
  post 'search' => 'users#search'

  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  root 'devise/sessions#new'
  end


  resources :companies do
    collection do
      get 'events'
    end
  end

  # post 'companies/publish', to: "companies#pub"
  #
  # get 'companies/subscribe', to: "companies#sub"

  # get 'staticpages/home'

  get 'staticpages/help'


  get 'staticpages/tour'

  get 'staticpages/about'


  get 'static/pages'
  get 'users/preview'
  get 'users/revise'
  # get '/sectors/:id', to: "sectors#show"
  resources :sectors
  resources :users do
    resources :trades
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
