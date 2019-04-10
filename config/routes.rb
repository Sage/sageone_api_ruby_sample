Rails.application.routes.draw do

  root   'static_pages#home'
  get    'signup'        => 'users#new'
  get    'login'         => 'sessions#new'
  post   'login'         => 'sessions#create'
  delete 'logout'        => 'sessions#destroy'
  get    'sageone_auth'  => 'sage_one#auth'
  get    'sageone_data'  => 'sage_one#data'
  get    'auth/callback' => 'sage_one#exchange_code_for_token'
  get    'call_api'      => 'sage_one#call_api'
  post   'call_api'      => 'sage_one#call_api'
  get    'renew_token'   => 'sage_one#renew_token'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
