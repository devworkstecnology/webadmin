class WebAdmin::Permission < ActiveRecord::Base
  include I18n::Alchemy
  
  belongs_to :user

  has_enumeration_for :permission_type, :with => WebAdmin::PermissionType, create_helpers: true

  validates :model, :permission_type, presence: true
end
