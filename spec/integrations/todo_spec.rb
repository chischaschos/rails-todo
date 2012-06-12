require 'spec_helper'

describe "TODOS creation" do

  it "Adds new items" do
    visit '/todos/new'
    fill_in 'name', with: 'Ir por leche'
    click_button 'Agregar'
    save_and_open_page
    page.has_content?('Correctly added').should be_true
  end
end
