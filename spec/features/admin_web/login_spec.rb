require 'rails_helper'

RSpec.describe "Login", :type => :feature do
  it "login" do
    user = create(:web_admin_user)

    visit web_admin.root_path

    expect(page).to have_content "Acesso"

    fill_in 'Email', with: "user@email.com"
    fill_in 'Senha', with: "12345678"

    click_button 'Entrar'

    expect(page).to have_content "Bem vindo"
  end
end
