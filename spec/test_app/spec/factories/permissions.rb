FactoryGirl.define do
  factory :manage_user, class: "WebAdmin::Permission" do
    model "web_admin/users"
    permission_type WebAdmin::PermissionType::ACCESS
  end

  factory :manage_video, class: "WebAdmin::Permission" do
    model "web_admin/videos"
    permission_type WebAdmin::PermissionType::ACCESS
  end

  factory :manage_post, class: "WebAdmin::Permission" do
    model "web_admin/posts"
    permission_type WebAdmin::PermissionType::ACCESS
  end

  factory :manage_album, class: "WebAdmin::Permission" do
    model "web_admin/albums"
    permission_type WebAdmin::PermissionType::ACCESS
  end

  factory :manage_image, class: "WebAdmin::Permission" do
    model "web_admin/images"
    permission_type WebAdmin::PermissionType::ACCESS
  end

  factory :manage_institutional, class: "WebAdmin::Permission" do
    model "web_admin/institutionals"
    permission_type WebAdmin::PermissionType::ACCESS
  end

  factory :manage_event, class: "WebAdmin::Permission" do
    model "web_admin/events"
    permission_type WebAdmin::PermissionType::ACCESS
  end
end
