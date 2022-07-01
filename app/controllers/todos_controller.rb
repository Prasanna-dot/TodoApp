class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def hearder
  end

  def login
  end

  def insert
    @todo = Todo.new(user_params)
    if @todo.save
      redirect_to "/"
    end
  end

  def complete
    @comp = Todo.find(params[:id])
    @comp[:completed] = true
    @comp.save
    redirect_to "/"
  end

  def delete
    @comp = Todo.find(params[:id])
    @comp.destroy
    redirect_to "/"
  end

  private

  def user_params
    params.require(:todo).permit(:add_task, :date, :completed)
  end
end
