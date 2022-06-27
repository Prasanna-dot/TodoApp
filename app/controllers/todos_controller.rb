class TodosController < ApplicationController
  def index
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
<<<<<<< HEAD
    @todo.save
=======
>>>>>>> 1185b60f52959f561a740f5ad86e7a1839138c29
  end

  def complete
    @comp = Todo.find(params[:id])
    @comp[:completed] = true
    if Date.today < Date.parse(@comp.date) && @comp.save
      @todos = Todo.all
      render "todos/due_later"
    elsif @comp.date == Date.today.to_s && @comp.save
      @todos = Todo.all
      render "todos/due_today"
    else
      @comp.save
      @todos = Todo.all
      render "todos/overdue"
    end
  end

  private

  def user_params
    params.require(:todo).permit(:add_task, :date, :completed)
  end
end
