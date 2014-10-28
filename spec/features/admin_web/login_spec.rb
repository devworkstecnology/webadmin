require 'rails_helper'

RSpec.describe "Login", :type => :feature do
  it "login" do
    user = create(:admin_web_user)

    visit admin_web.root_path

    expect(page).to have_content "AdminWeb - Administração de sites"

    fill_in 'Email', with: "user@email.com"
    fill_in 'Senha', with: "12345678"

    click_button 'Entrar'

    expect(page).to have_content "Bem vindo"
  end
end
