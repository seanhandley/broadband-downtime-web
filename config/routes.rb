BroadbandDowntimeWeb::Application.routes.draw do
  resources :probes, :only => [:create, :index] do
    get :plot, :on => :collection
    get :months, :on => :collection
  end
  root :to => 'home#index'
end
