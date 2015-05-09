module AdminWeb
  class Institutional < ActiveRecord::Base
    include I18n::Alchemy

    validates :name, :body, presence: true

    def to_s
      name
    end
  end
end
