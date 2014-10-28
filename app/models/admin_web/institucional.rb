module AdminWeb
  class Institucional < ActiveRecord::Base

    validates :name, :body, presence: true

    def to_s
      name
    end
  end
end
