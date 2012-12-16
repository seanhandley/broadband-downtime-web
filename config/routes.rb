BroadbandDowntimeWeb::Application.routes.draw do
  resources :probes, :only => [:create]
  root :to => 'home#index'
end
