Rails.application.routes.draw do
  root "todos#index"
  get "/addtask", to: "todos#index"
  match "/add_task", :to => "todos#insert", :via => :post
  get "/overdue", to: "todos#overdue"
  get "/due_today", to: "todos#due_today"
  get "/due_later", to: "todos#due_later"
  get "/complete/:id" => "todos#complete", as: :complete
end
