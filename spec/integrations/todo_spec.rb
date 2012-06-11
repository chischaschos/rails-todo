require 'spec_helper'

describe "TODOS creation" do

  it "Adds new items" do
    visit '/new'
    #save_and_open_page
    fill_in 'name', with: 'Ir por leche'
    click_button 'Agregar'
    page.has_content?('Correctly added')
  end
end
