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

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todo_url(@todo), notice: "Todo was successfully created." }
      end
    end
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