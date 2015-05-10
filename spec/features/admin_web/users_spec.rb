require "rails_helper"

feature WebAdmin::User do
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
    select 'Acesso total', from: 'user_permissions_attributes_0_permission_type'
    select 'Acesso total', from: 'user_permissions_attributes_1_permission_type'
    select 'Acesso total', from: 'user_permissions_attributes_2_permission_type'
    select 'Acesso total', from: 'user_permissions_attributes_3_permission_type'
    select 'Acesso total', from: 'user_permissions_attributes_4_permission_type'
    select 'Acesso total', from: 'user_permissions_attributes_5_permission_type'

    click_button 'Salvar'

    expect(page).to have_content "Usuário criado(a) com sucesso"

    expect(page).to have_content "email@email.com"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'email@email.com'

    expect(page).to have_field "Email", with: "email@email.com"
    expect(page).to have_field "Senha", with: ""
    expect(page).to have_field "Confirmação de senha", with: ""
    expect(page).to have_select 'user_permissions_attributes_0_permission_type', selected: 'Acesso total'
    expect(page).to have_select 'user_permissions_attributes_1_permission_type', selected: 'Acesso total'
    expect(page).to have_select 'user_permissions_attributes_2_permission_type', selected: 'Acesso total'
    expect(page).to have_select 'user_permissions_attributes_3_permission_type', selected: 'Acesso total'
    expect(page).to have_select 'user_permissions_attributes_4_permission_type', selected: 'Acesso total'
    expect(page).to have_select 'user_permissions_attributes_5_permission_type', selected: 'Acesso total'

    fill_in 'Email', with: "email1@email.com"
    select 'Acesso total', from: 'user_permissions_attributes_0_permission_type'
    select 'Apenas leitura', from: 'user_permissions_attributes_1_permission_type'
    select 'Bloqueado', from: 'user_permissions_attributes_2_permission_type'
    select 'Atualizar', from: 'user_permissions_attributes_3_permission_type'
    select 'Acesso total', from: 'user_permissions_attributes_4_permission_type'
    select 'Acesso total', from: 'user_permissions_attributes_5_permission_type'

    click_button "Salvar"

    expect(page).to have_content "Usuário editado(a) com sucesso"

    expect(page).to have_content "email1@email.com"
    expect(page).to have_content I18n.l(Date.current)

    click_link 'email1@email.com'

    expect(page).to have_field "Email", with: "email1@email.com"
    expect(page).to have_select 'user_permissions_attributes_0_permission_type', selected: 'Acesso total'
    expect(page).to have_select 'user_permissions_attributes_1_permission_type', selected: 'Apenas leitura'
    expect(page).to have_select 'user_permissions_attributes_2_permission_type', selected: 'Bloqueado'
    expect(page).to have_select 'user_permissions_attributes_3_permission_type', selected: 'Atualizar'
    expect(page).to have_select 'user_permissions_attributes_4_permission_type', selected: 'Acesso total'
    expect(page).to have_select 'user_permissions_attributes_5_permission_type', selected: 'Acesso total'

    click_link 'Apagar'

    expect(page).to have_content "Usuário apagado(a) com sucesso"
  end
end
