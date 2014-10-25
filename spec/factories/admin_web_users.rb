FactoryGirl.define do
  factory :admin_web_user, :class => 'AdminWeb::User' do
    email "user@email.com"
    password "12345678"
    password_confirmation "12345678"
  end

end
