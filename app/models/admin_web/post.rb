module AdminWeb
  class Post < ActiveRecord::Base
    mount_uploader :image, ImagePostUploader

    belongs_to :user

    validates :user, :user_id, :title, :abstract, :body, presence: true

    def to_s
      title
    end
  end
end
