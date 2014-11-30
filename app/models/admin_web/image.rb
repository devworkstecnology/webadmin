module AdminWeb
  class Image < ActiveRecord::Base
    mount_uploader :file, ImageUploader

    belongs_to :album

    validates :album, :file, presence: true
  end
end
