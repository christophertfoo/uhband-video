UhbandVideo::Application.routes.draw do
  scope '/api' do
    resources :tag_instances
  
    resources :media
  
    resources :tag_instances
  
    resources :tags
  
    resources :media_types
    
    get '/search', to: 'media#search'
  end
    
  root 'main#home'
end
