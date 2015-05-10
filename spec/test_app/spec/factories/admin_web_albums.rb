FactoryGirl.define do
  factory :web_admin_album, :class => 'WebAdmin::Album' do
    title "Álbum 1"
    local "Local album 1"
    date Date.current
  end
end
