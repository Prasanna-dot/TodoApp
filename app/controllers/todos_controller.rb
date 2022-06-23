class TodosController < ApplicationController
  def index
    # @user_params = user_params
  end

  def hearder
  end

  def overdue
    @todos = Todo.all
  end

  def due_today
    @todos = Todo.all
  end

  def due_later
    @todos = Todo.all
  end

  def insert
    @todo = Todo.new(user_params)
    @todo.save
    # render :plain => user_params["date"]
  end

  def complete
    @comp = Todo.find(params[:id])
    @comp[:completed] = true
    if @comp.save
      @todos = Todo.all
      render "todos/due_later"
    end
    # render "due_later"
    # render :plain => @comp[:completed] 

  end

  private
  def user_params
    params.require(:todo).permit(:add_task, :date, :completed)
  end
end