class TodosController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.create! params[:task]
    redirect_to todo_path(task)
  end

  def show
    @task = Task.find params[:id]
  end
end
