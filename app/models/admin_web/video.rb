module AdminWeb
  class Video < ActiveRecord::Base
    validates :description, :link, presence: true

    before_save :extract_id

    def extract_id
      self.link = self.link[/v=([^&]+)/, 1]
    end

    def to_s
      description
    end
  end
end
