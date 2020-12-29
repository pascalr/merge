def app(name)
  get "/app/#{name}", to: 'apps#show_app', as: name
end

# TODO: Automatically find all the index.html files in app/views and make them available
# Create update_... create_... and delte_... path automatically for every model

def lazy_resources(name)
  resources name, controller: 'database'
  #get "/#{name}/edit", to: 'database#edit_all', as: "edit_all_#{name}"
end

Rails.application.routes.draw do

  devise_for :users
  app 'desktop'
  app 'gallery'
  app 'explorer'
  app 'calendar'
  app 'calc'
  app 'chords_viewer'
  app 'shopping_list'
  app 'cheatsheet'
  app 'personal'

  get '/editor', to: 'editor#index', as: 'editor'
  get '/editor/edit', to: 'editor#edit', as: 'edit_file'
  put '/editor/save_file', to: 'editor#save_file', as: 'save_file'
  get '/editor/new_file', to: 'editor#new', as: 'new_file'
  #post '/editor/create', to: 'editor#create', as: 'create_view'

  get '/database', to: 'database#dashboard', as: 'database'

  lazy_resources :documents
  lazy_resources :folders
  lazy_resources :contacts
  lazy_resources :tasks
  lazy_resources :books
  lazy_resources :todos
  lazy_resources :events
  lazy_resources :purchases
  lazy_resources :parts
  lazy_resources :part_list_items
  lazy_resources :movies
  lazy_resources :suppliers
  lazy_resources :images
  lazy_resources :ideas
  lazy_resources :bookmarks
  lazy_resources :musics
  lazy_resources :milestones

  post '/db/create_table', to: 'apps#create_table', as: 'db_create_table'
  post '/db/:model_name/create_column', to: 'apps#create_column', as: 'db_create_column'

  post 'create_file', to: 'views#create_file', as: 'create_file'
  post 'create_folder', to: 'views#create_folder', as: 'create_folder'

  get '/app/:name', to: 'apps#show', as: 'app' # deprecated, use :app_name, this way the app can use the param :name
  get '/app/:app_name', to: 'apps#show'
  get '/app/:app_name/:action', to: 'apps#show'
  delete '/delete_file', to: 'apps#delete_file', as: 'delete_file'
  
  get '/inline_image', to: 'apps#inline_image', as: 'inline_image'
  post '/find_new_images', to: 'apps#find_new_images'
  
  #database_routes

  #resources :views, only: [:index, :show], param: :name
  root :to => redirect('/app/desktop')
end
