Rails.application.routes.draw do

  resources :calendars
  resources :tasks
  resources :events


  # get 'month' => 'calendar#index', as: :month
  
  root :to => 'home#home' 

end
