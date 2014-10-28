require 'rails_helper'

feature AdminWeb::Post do
  background do
    sign_in
  end

  scenario "create, update and destroy a post" do
    click_link 'Notícias'

    expect(page).to have_content 'Cadastro de notícias'

    click_link 'Nova'

    fill_in 'Título', with: "Primeira notícia"
    fill_in 'Resumo', with: "Resumo da primeira notícia"

    attach_file('Image', "spec/fixtures/p3-single.jpg")

    fill_in_ckeditor 'post_body', with: "Corpo da primeira notícia"

    click_button 'Salvar'

    expect(page).to have_content "Cadastro realizado com sucesso"

    expect(page).to have_content "Primeira notícia"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'Primeira notícia'

    expect(page).to have_field "Título", with: "Primeira notícia"
    expect(page).to have_field "Resumo", with: "Resumo da primeira notícia"

    fill_in 'Título', with: "Alterando a primeira notícia"
    fill_in 'Resumo', with: "Alterando o resumo da primeira notícia"

    fill_in_ckeditor 'post_body', with: "Alterando o corpo da primeira notícia"

    click_button "Salvar"

    expect(page).to have_content "Alteração realizada com sucesso"

    expect(page).to have_content "Alterando a primeira notícia"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'Alterando a primeira notícia'

    expect(page).to have_field "Título", with: "Alterando a primeira notícia"
    expect(page).to have_field "Resumo", with: "Alterando o resumo da primeira notícia"

    click_link 'Apagar'

    expect(page).to have_content "Registro excluído com sucesso"
  end
end
