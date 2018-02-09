Rails.application.routes.draw do
    resources :people, except: [:show], constraints: { id: /[a-f0-9]{24}+/ }

    root to: "people#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
