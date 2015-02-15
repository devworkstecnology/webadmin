require 'rails_helper'

feature AdminWeb::Permission do
  scenario "verify permission to user" do
    user = create(:admin_web_user)
    user.permissions = [
      create(:manage_post, permission_type: AdminWeb::PermissionType::DENY),
      create(:manage_user, permission_type: AdminWeb::PermissionType::ACCESS),
      create(:manage_video, permission_type: AdminWeb::PermissionType::READ),
      create(:manage_album, permission_type: AdminWeb::PermissionType::ACCESS),
      create(:manage_image, permission_type: AdminWeb::PermissionType::ACCESS),
      create(:manage_institutional, permission_type: AdminWeb::PermissionType::MODIFY),
      create(:manage_event, permission_type: AdminWeb::PermissionType::ACCESS),
    ]

    visit admin_web.root_path
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_button 'Entrar'

    expect(page).to_not have_link 'Notícias'
    expect(page).to have_link 'Institucionais'
    expect(page).to have_link 'Vídeos'
    expect(page).to have_link 'Álbuns'
    expect(page).to have_link 'Usuários'
    expect(page).to have_link 'Eventos'

    visit '/admin_web/posts'
    expect(page).to have_content "Você não tem acesso a essa página. Contate o administrador do sistema, para maiores informações."

    visit admin_web.root_path

    click_link 'Institucionais'

    expect(page).to have_content "Cadastro de institucionais"
    expect(page).to_not have_link 'Novo'

  end
end
