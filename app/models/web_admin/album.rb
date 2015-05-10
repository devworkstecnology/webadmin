module WebAdmin
  class Album < ActiveRecord::Base
    include I18n::Alchemy

    has_many :images

    validates :title, :date, :local, presence: true

    def to_s
      title
    end
  end
end
