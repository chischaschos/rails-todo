require 'spec_helper'

describe "CRUD Tasks" do

  context "creation" do
    it "successfully create new todo", js: true do
      visit root_path
      fill_in 'task_name', with: 'Ir por cachuchas'
      click_button 'Agregar'
      page.should have_content('All tasks')
      page.should have_css("a:contains('Ir por cachuchas')")
      #save_and_open_page
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

  context "Update a todo" do
    let!(:tasks) do
      [ Task.create!(name: 'Ir por leche'),
        Task.create!(name: 'Comprar cheves'),
        Task.create!(name: 'Ir al cine') ]
    end

    it "updates an existing todo" do
      visit root_path
      click_link 'Ir por leche'
      page.has_content?('Detalle de tarea: Ir por leche').should be_true
      fill_in 'task_name', with: 'Ir por cheve'
      click_button 'Actualizar'
      page.has_content?('All tasks').should be_true
      page.has_content?('Ir por cheve').should be_true
    end
  end

  context "Destroy todo" do
    let!(:tasks) do
      [ Task.create!(name: 'Ir por leche'),
        Task.create!(name: 'Comprar cheves'),
        Task.create!(name: 'Ir al cine') ]
    end

    it "successfully destroy a todo" do
      visit root_path
      find("a:contains('cheves') + a").click
      page.has_content?('Comprar cheves').should be_false
    end

    it "correctly deletes a newly added todo" do
      visit root_path
      fill_in 'task_name', with: 'Ir tortas'
      click_button 'Agregar'
      visit root_path
      find('li:last-child a:first-child').should have_content("Ir tortas")
      find('li:last-child a:last-child').click
      page.should_not have_content("Ir tortas")
    end
  end
end
