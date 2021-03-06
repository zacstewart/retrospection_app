RetrospectionApp::Application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  resources :sleeps, except: [:show, :new] do
    get 'week_of/:date' => 'sleeps#week_of', on: :collection
  end

  resources :trackables, except: :new do
    resources :trackings
  end

  resources :retrospections, except: :new

  root to: 'application#home'

  mount Devise::Oauth2Providable::Engine => '/oauth2'
end
