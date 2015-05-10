module WebAdmin
  class Image < ActiveRecord::Base
    include I18n::Alchemy
    mount_uploader :file, ImageUploader

    belongs_to :album

    validates :album, :file, presence: true
  end
end
