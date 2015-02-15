require "rails_helper"

feature AdminWeb::User do
  background do
    sign_in
  end

  scenario "create, update and destroy a user" do
    click_link 'Usuários'

    expect(page).to have_content 'Cadastro de usuários'

    click_link 'Novo'

    fill_in 'Email', with: "email@email.com"
    fill_in 'Senha', with: "12345678"
    fill_in 'Confirmação de senha', with: "12345678"

    click_button 'Salvar'

    expect(page).to have_content "Cadastro realizado com sucesso"

    expect(page).to have_content "email@email.com"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'email@email.com'

    expect(page).to have_field "Email", with: "email@email.com"
    expect(page).to have_field "Senha", with: ""
    expect(page).to have_field "Confirmação de senha", with: ""

    fill_in 'Email', with: "email1@email.com"

    click_button "Salvar"

    expect(page).to have_content "Alteração realizada com sucesso"

    expect(page).to have_content "email1@email.com"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'email1@email.com'

    expect(page).to have_field "Email", with: "email1@email.com"

    click_link 'Apagar'

    expect(page).to have_content "Registro excluído com sucesso"
  end
end
