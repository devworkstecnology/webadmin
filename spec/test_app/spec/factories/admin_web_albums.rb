FactoryGirl.define do
  factory :admin_web_album, :class => 'AdminWeb::Album' do
    title "Álbum 1"
    local "Local album 1"
    date Date.current
  end
end
