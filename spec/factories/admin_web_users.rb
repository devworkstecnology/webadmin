FactoryGirl.define do
  factory :web_admin_user, :class => 'WebAdmin::User' do
    email "user@email.com"
    password "12345678"
    password_confirmation "12345678"

    factory :web_admin_user_with_permission do
      transient do
        permissions_count 1
      end

      after(:create) do |user, evaluator|
        create_list(:manager_user, evaluator.permissions_count, user: user)
        create_list(:manager_video, evaluator.permissions_count, user: user)
        create_list(:manager_post, evaluator.permissions_count, user: user)
        create_list(:manager_album, evaluator.permissions_count, user: user)
        create_list(:manager_image, evaluator.permissions_count, user: user)
        create_list(:manager_insitutional, evaluator.permissions_count, user: user)
        create_list(:manager_event, evaluator.permissions_count, user: user)
      end
    end
  end

end
