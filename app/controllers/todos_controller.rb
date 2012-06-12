class TodosController < ApplicationController
  def new
    @todo = Task.new
  end
end
