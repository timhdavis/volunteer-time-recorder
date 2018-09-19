Rails.application.routes.draw do

  root 'welcome#index', as: 'home'

  get 'welcome/index'

  #get 'volunteers/index'

  # Resources: (maps HTTP verbs to Controller actions)

  resources :volunteers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
