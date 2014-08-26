Dict::Application.routes.draw do
  devise_for :users
  resources :words

  get 'owner' => "words#owner"
  get 'known' => "words#known"
  get 'unknown' => "words#unknown"

  root :to => redirect('/words')

end
