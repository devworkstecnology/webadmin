class AdminWeb::Permission < ActiveRecord::Base
  belongs_to :user

  has_enumeration_for :permission_type, :with => AdminWeb::PermissionType, create_helpers: true

  validates :model, :permission_type, presence: true
end
