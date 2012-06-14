class TodosController < ApplicationController
  def edit
    @task = Task.find params[:id]
  end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create! params[:task]
    redirect_to root_path
  end

  def search
    @tasks = Task.search params[:term]
    render :index
  end

  def show
    @task = Task.find params[:id]
  end

  def update
    task = Task.find params[:id]
    task.update_attributes params[:task]
    redirect_to root_path
  end
end
