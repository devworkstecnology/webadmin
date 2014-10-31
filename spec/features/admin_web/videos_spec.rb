require "rails_helper"

feature AdminWeb::Video do
  background do
    sign_in
  end

  scenario "create, update and destroy a video" do
    click_link 'Vídeos'

    expect(page).to have_content 'Cadastro de vídeos'

    click_link 'Novo'

    fill_in 'Descrição', with: "Primeiro vídeo"
    fill_in 'Link do Youtube', with: "www.youtube.com/watch?v=uzxpH-MtIts"

    click_button 'Salvar'

    expect(page).to have_content "Cadastro realizado com sucesso"

    expect(page).to have_content "Primeiro vídeo"
    expect(page).to have_content "uzxpH-MtIts"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'Primeiro vídeo'

    expect(page).to have_field "Descrição", with: "Primeiro vídeo"
    expect(page).to have_field "Link do Youtube", with: "uzxpH-MtIts"

    fill_in 'Descrição', with: "Alterando a Primeiro vídeo"
    fill_in 'Link do Youtube', with: "www.youtube.com/watch?v=uzxpH-MtItsdadada"

    click_button "Salvar"

    expect(page).to have_content "Alteração realizada com sucesso"

    expect(page).to have_content "Alterando a Primeiro vídeo"
    expect(page).to have_content "uzxpH-MtItsdadada"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'Alterando a Primeiro vídeo'

    expect(page).to have_field "Descrição", with: "Alterando a Primeiro vídeo"
    expect(page).to have_field 'Link do Youtube', with: "uzxpH-MtItsdadada"

    click_link 'Apagar'

    expect(page).to have_content "Registro excluído com sucesso"
  end
end
