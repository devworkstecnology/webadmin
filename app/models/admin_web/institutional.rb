module AdminWeb
  class Institutional < ActiveRecord::Base

    validates :name, :body, presence: true

    def to_s
      name
    end
  end
end
