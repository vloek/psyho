Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get 'pages/index'
  root :to => "pages#index"
    
  scope "/:locale", :locale => /en|ru/ do
    # devise_for :users
    # devise_for :users, ActiveAdmin::Devise.config
    # ActiveAdmin.routes(self)
    
    resources :units
    
    resources :news do
          get 'page/:page', :action => :index, :on => :collection
    end
    
    resources :categories do 
      get 'page/:page' => 'categories#index', :action => :index, :on => :collection
    end
    
    
    get 'pages/*page' => 'pages#index', :as => 'pages'
    
  end
end
