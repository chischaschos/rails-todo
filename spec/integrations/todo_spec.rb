require 'spec_helper'

describe "TODOS creation" do

  it "Adds new items" do
    visit '/todos/new'
    fill_in 'task_name', with: 'Ir por leche'
    click_button 'Agregar'
    #save_and_open_page
    page.has_content?('Detalle de tarea').should be_true
    page.has_content?('Ir por leche').should be_true
  end
end
