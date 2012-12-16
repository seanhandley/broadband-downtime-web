BroadbandDowntimeWeb::Application.routes.draw do
  resources :probes, :only => [:create, :index]
  root :to => 'home#index'
end
