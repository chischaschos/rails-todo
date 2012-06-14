require 'spec_helper'

describe "CRUD Tasks" do

  context "creation" do
    it "successfully create new todo" do
      visit '/todos/new'
      fill_in 'task_name', with: 'Ir por leche'
      click_button 'Agregar'
      #save_and_open_page
      page.has_content?('Todas las tareas').should be_true
      page.has_content?('Ir por leche').should be_true
    end
  end

  context "Retrieval" do
    let!(:tasks) do
      [ Task.create!(name: 'Ir por leche'),
        Task.create!(name: 'Comprar cheves'),
        Task.create!(name: 'Ir al cine') ]
    end

    it "shows all existing todos" do
      visit "/"
      tasks.each do |task|
        page.has_content?(task.name).
          should be_true, "Task not found '#{task.name}'"
      end
    end
  end

  context "Search todos" do
    let!(:tasks) do
      [ Task.create!(name: 'Ir por leche'),
        Task.create!(name: 'Comprar cheves'),
        Task.create!(name: 'Ir al cine') ]
    end

    it "search for todos with name matching the parameter one" do
      visit '/todos/search'
    end
  end
end
