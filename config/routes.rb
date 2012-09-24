RetrospectionApp::Application.routes.draw do
  resources :retrospections, except: :new
end
