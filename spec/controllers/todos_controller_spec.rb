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
        response.should be_redirect
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

end
