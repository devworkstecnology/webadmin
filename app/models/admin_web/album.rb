module AdminWeb
  class Album < ActiveRecord::Base
    include I18n::Alchemy

    validates :title, :date, :local, presence: true

    def to_s
      title
    end
  end
end
