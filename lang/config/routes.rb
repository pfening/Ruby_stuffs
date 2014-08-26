Lang::Application.routes.draw do
  resources :languages do
    resources :words
end

end
