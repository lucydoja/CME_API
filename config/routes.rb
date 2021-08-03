Rails.application.routes.draw do
  #resources :specialties
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'specialties' => 'cme#specialties'
      get 'states' => 'cme#states'
      get ':specialty/:state' => 'cme#cme'
    end
  end
end