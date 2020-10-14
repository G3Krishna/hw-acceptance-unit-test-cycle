Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  
  root :to => redirect('/movies')
  
  get '/similar_directors', to: 'movies#similar_directors'

end
