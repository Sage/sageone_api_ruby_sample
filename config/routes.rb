Rails.application.routes.draw do

  root   'static_pages#home'
  get    'signup'        => 'users#new'
  get    'login'         => 'sessions#new'
  post   'login'         => 'sessions#create'
  delete 'logout'        => 'sessions#destroy'
  get    'sage_accounting_auth'  => 'sage_accounting#auth'
  get    'sage_accounting_data'  => 'sage_accounting#data'
  get    'auth/callback' => 'sage_accounting#exchange_code_for_token'
  get    'call_api'      => 'sage_accounting#call_api'
  post   'call_api'      => 'sage_accounting#call_api'
  get    'renew_token'   => 'sage_accounting#renew_token'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
