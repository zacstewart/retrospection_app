RetrospectionApp::Application.routes.draw do
  resources :sleeps, except: :show
  resources :retrospections, except: :new, path: '/'
  root to: 'retrospections#index'
end
