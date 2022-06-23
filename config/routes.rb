Rails.application.routes.draw do
  resources :todos
  root 'todos#index'
  match '/addtask', :to=> 'todos#index', :via => :get
  match '/add_task', :to=> 'todos#insert', :via => :post
  match '/overdue', :to=> 'todos#overdue', :via => :get
  match '/due_today', :to=> 'todos#due_today', :via => :get
  match '/due_later', :to=> 'todos#due_later', :via => :get
  # match '/complete', :to=> 'todos#complete', :via => :get
  get 'complete/:id' => 'todos#complete', as: :complete
end
