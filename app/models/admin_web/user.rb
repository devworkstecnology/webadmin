module AdminWeb
  class User < ActiveRecord::Base
    extend EnumerateIt

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

    has_many :posts
    has_many :permissions

    has_enumeration_for :user_type, :with => AdminWeb::UserType, create_helpers: true

    accepts_nested_attributes_for :permissions

    def to_s
      email
    end

    def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end
  end
end
