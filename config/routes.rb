RetrospectionApp::Application.routes.draw do
  resources :retrospections, except: :new, path: '/'
  root to: 'retrospections#index'
end
