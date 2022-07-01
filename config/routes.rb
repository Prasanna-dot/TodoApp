Rails.application.routes.draw do
  root "todos#index"
  get "/addtask", to: "todos#index"
  match "/add_task", :to => "todos#insert", :via => :post
  get "/complete/:id" => "todos#complete", as: :complete
  get "/delete/:id" => "todos#delete", as: :delete
end
