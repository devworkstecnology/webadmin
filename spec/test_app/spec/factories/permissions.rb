FactoryGirl.define do
  factory :manage_user, class: "AdminWeb::Permission" do
    model "admin_web/users"
    permission_type AdminWeb::PermissionType::ACCESS
  end

  factory :manage_video, class: "AdminWeb::Permission" do
    model "admin_web/videos"
    permission_type AdminWeb::PermissionType::ACCESS
  end

  factory :manage_post, class: "AdminWeb::Permission" do
    model "admin_web/posts"
    permission_type AdminWeb::PermissionType::ACCESS
  end

  factory :manage_album, class: "AdminWeb::Permission" do
    model "admin_web/albums"
    permission_type AdminWeb::PermissionType::ACCESS
  end

  factory :manage_image, class: "AdminWeb::Permission" do
    model "admin_web/images"
    permission_type AdminWeb::PermissionType::ACCESS
  end

  factory :manage_institutional, class: "AdminWeb::Permission" do
    model "admin_web/institutionals"
    permission_type AdminWeb::PermissionType::ACCESS
  end

  factory :manage_event, class: "AdminWeb::Permission" do
    model "admin_web/events"
    permission_type AdminWeb::PermissionType::ACCESS
  end
end
