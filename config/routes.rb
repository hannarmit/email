Library::Application.routes.draw do
  

  resources :books do
    resources :comments
    collection do
      get :search
    end
    resources :reservations, only: [:create, :new] do
      member do
        put :free
      end
    end

  end
 #modified 08-03-2012
  scope '(:locale)' do
  resources :books
  resources :reservations do
  put :free, :on => :member
 end
#end
  root :to => 'books#index'
end
end
