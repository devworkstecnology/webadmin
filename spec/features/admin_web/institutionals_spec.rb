require 'rails_helper'

feature WebAdmin::Institutional do
  background do
    sign_in
  end

  scenario "create, update and destroy a institucional" do
    click_link 'Institucionais'

    expect(page).to have_content 'Cadastro de institucionais'

    click_link 'Novo'

    fill_in 'Título', with: "Institucional 1"
    fill_in_ckeditor 'institutional_body', with: "Corpo da primeira página institucional"

    click_button 'Salvar'

    expect(page).to have_content "Institucional criado(a) com sucesso"

    expect(page).to have_content "Institucional 1"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'Institucional 1'

    expect(page).to have_field "Título", with: "Institucional 1"

    fill_in 'Título', with: "Alterando a institucional 1"
    fill_in_ckeditor 'institutional_body', with: "Alterando o corpo da primeira página institucional"

    click_button "Salvar"

    expect(page).to have_content "Institucional editado(a) com sucesso"

    expect(page).to have_content "Alterando a institucional 1"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'Alterando a institucional 1'

    expect(page).to have_field "Título", with: "Alterando a institucional 1"

    click_link 'Apagar'

    expect(page).to have_content "Institucional apagado(a) com sucesso"
  end
end
