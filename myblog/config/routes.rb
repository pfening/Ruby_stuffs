Myblog::Application.routes.draw do
  resources :articles
  resources :comments
  root :to => redirect('/articles')

end
