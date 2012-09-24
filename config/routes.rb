RetrospectionApp::Application.routes.draw do
  devise_for :users

  resources :sleeps, except: :show
  resources :retrospections, except: :new
  root to: 'application#home'
end
