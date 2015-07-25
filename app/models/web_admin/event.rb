module WebAdmin
  class Event < ActiveRecord::Base
    include I18n::Alchemy
    mount_uploader :image, ImageEventUploader

    validates :title, :start_date, :end_date, :description, presence: true
    validate :end_date_is_greater_than_start_date

    def to_s
      title
    end

    private

    def end_date_is_greater_than_start_date
      return nil if self.start_date.present? and self.end_date.present? and self.end_date > self.start_date

      self.errors.add(:end_date, I18n.t('activerecord.errors.messages.end_date_is_greater_than_start_date'))
    end
  end
end
