Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "main/test"  , to: "main#test"
  post "main/test3" , to: "main#test3"
  get "main/test"
  get "score/list" , to: "main#list"
  get "main/delete", to: "main#delete"
  get "main/edit", to: "main#edit"
  post "score/save", to: "main#save"
  # Defines the root path route ("/")
  # root "articles#index"
  root "main#test2"
end
