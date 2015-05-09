require 'rails_helper'

feature AdminWeb::Event do
  background do
    sign_in
  end

  scenario "create, update and destroy a event" do
    click_link 'Eventos'

    expect(page).to have_content 'Cadastro de eventos'

    click_link 'Novo'

    fill_in 'Título', with: "Evento 1"
    fill_in 'Início às', with: '30/01/2015 21:00'
    fill_in 'Término às', with: '31/01/2015 00:00'
    fill_in 'Descrição', with: 'Descrição do evento 1'
    fill_in 'CEP', with: '64000-128'
    fill_in 'Logradouro', with: 'Rua João Damasceno'
    fill_in 'Número', with: '3201'
    fill_in 'Bairro', with: 'Planalto Ininga'
    fill_in 'Cidade', with: 'Teresina'
    fill_in 'Estado', with: 'Piauí'

    click_button 'Salvar'

    expect(page).to have_content "Evento criado(a) com sucesso"

    expect(page).to have_content "Evento 1"
    expect(page).to have_content "30/01/2015 21:00"
    expect(page).to have_content "31/01/2015 00:00"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'Evento 1'

    expect(page).to have_field 'Título', with: "Evento 1"
    expect(page).to have_field 'Início às', with: '30/01/2015 21:00'
    expect(page).to have_field 'Término às', with: '31/01/2015 00:00'
    expect(page).to have_field 'Descrição', with: 'Descrição do evento 1'
    expect(page).to have_field 'CEP', with: '64000-128'
    expect(page).to have_field 'Logradouro', with: 'Rua João Damasceno'
    expect(page).to have_field 'Número', with: '3201'
    expect(page).to have_field 'Bairro', with: 'Planalto Ininga'
    expect(page).to have_field 'Cidade', with: 'Teresina'
    expect(page).to have_field 'Estado', with: 'Piauí'

    fill_in 'Título', with: "Alterando Evento 1"
    fill_in 'Início às', with: '01/02/2015 21:00'
    fill_in 'Término às', with: '02/02/2015 00:00'
    fill_in 'Descrição', with: 'Alterando Descrição do evento 1'
    fill_in 'CEP', with: '64000-128'
    fill_in 'Logradouro', with: 'Rua Magalhães Filho'
    fill_in 'Número', with: '712'
    fill_in 'Bairro', with: 'Centro/Sul'
    fill_in 'Cidade', with: 'Teresina'
    fill_in 'Estado', with: 'Piauí'

    click_button "Salvar"

    expect(page).to have_content "Evento editado(a) com sucesso"

    expect(page).to have_content "Alterando Evento 1"
    expect(page).to have_content "01/02/2015 21:00"
    expect(page).to have_content "02/02/2015 00:00"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'Alterando Evento 1'

    expect(page).to have_field 'Título', with: "Alterando Evento 1"
    expect(page).to have_field 'Início às', with: '01/02/2015 21:00'
    expect(page).to have_field 'Término às', with: '02/02/2015 00:00'
    expect(page).to have_field 'Descrição', with: 'Alterando Descrição do evento 1'
    expect(page).to have_field 'CEP', with: '64000-128'
    expect(page).to have_field 'Logradouro', with: 'Rua Magalhães Filho'
    expect(page).to have_field 'Número', with: '712'
    expect(page).to have_field 'Bairro', with: 'Centro/Sul'
    expect(page).to have_field 'Cidade', with: 'Teresina'
    expect(page).to have_field 'Estado', with: 'Piauí'

    click_link 'Apagar'

    expect(page).to have_content "Evento apagado(a) com sucesso"
  end
end
