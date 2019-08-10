Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Route for get the comparations history
  get '/api/comparations', to: 'comparations#index'
  # Route for get the comparations history
  get '/api/comparations/criterias', to: 'strings#criterias'
  # history of comparations
  get '/api/comparations/history', to: 'comparations#history'
  # history of comparations
  get '/api/comparations/history/:id', to: 'comparations#one_history'
  # Route one of comparations
  get '/api/comparations/:id', to: 'comparations#one_comparation'
  # Route for get an comparation
  get '/api/strings/:seed/compare/:comparator', to: 'strings#compare'
  # Route for the index route strings
  get '/api/strings/:seed/compare', to: 'strings#compare'
  # Route for the index route strings
  get '/api/strings', to: 'strings#index'
  # Route for the index route strings
  get '/api/strings/:seed', to: 'strings#index'
  # Redirect /api to /api/
  get '/api', to: redirect('/api/')
end
