Lang2::Application.routes.draw do
  resources :menus

  resources :words

  resources :languages do

  get 'owner' => "words#owner"
  get 'known' => "words#known"
  get 'unknown' => "words#unknown"
  get 'ask' => "languages#ask"
end  
  get 'select' => "languages#select"

end
