require 'spec_helper'

describe TodosController do
  describe "#new" do
    context "successfully shows the new form" do
      specify do
        get :new
      end
    end
  end

  describe "#create" do
    context "successfully creates a new task" do
      specify do
        post :create
        response.status.should == 200
      end
    end
  end

  describe "#show" do
    context "when the task exists" do
      let(:task) do
        Task.create! name: 'The test task'
      end

      specify do
        get :show, id: task.id
        assigns(:task).should == task
        response.should be_success
      end
    end
  end

  describe "#index" do
    render_views

    let(:tasks) do
      [ Task.create!(name: 'Ir por leche') ]
    end

    before do
      Task.should_receive(:all).and_return tasks
    end

    specify do
      get :index
      assigns(:tasks).should == tasks
      response.should be_success
    end
  end

  describe "#search" do
    render_views

    let(:tasks) do
      [ Task.create!(name: 'Ir por leche') ]
    end

    before do
      Task.should_receive(:search).with('leche').
        and_return tasks
    end

    specify do
      get :search, term: 'leche'
      assigns(:tasks).should == tasks
      response.should render_template('todos/index')
    end
  end

  describe "#edit" do
    let(:task) { Task.create!(name: 'Ir por leche') }

    specify do
      get :edit, id: task.id
      assigns(:task).should == task
      response.should be_success
    end
  end

  describe "#update" do
    let(:task) { Task.create!(name: 'Ir por leche') }

    before do
      Task.should_receive(:find).with(task.id.to_s).and_return task
    end

    specify do
      put :update, id: task.id
      response.should redirect_to(root_path)
    end
  end

  describe "#destroy" do
    let(:task) { Task.create!(name: 'Ir por leche') }

    before do
      Task.should_receive(:destroy).with(task.id.to_s).and_return true
    end

    specify do
      delete :destroy, id: task.id
      response.should redirect_to(root_path)
    end
  end

end
