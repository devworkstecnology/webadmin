require 'rails_helper'

module WebAdmin
  RSpec.describe Event, :type => :model do
    context "Validations" do
      it { should validate_presence_of :title }
      it { should validate_presence_of :start_date }
      it { should validate_presence_of :end_date }
      it { should validate_presence_of :description }

      context "when end_date is greater than start_date" do
        it 'is valid' do
          subject.stub(start_date: Time.current)
          subject.stub(end_date: Time.current + 3.days)

          subject.valid?

          expect(subject.errors[:end_date]).to be_empty
        end
      end

      context "when end_date is less than start_date" do
        it 'is not valid' do
          subject.stub(start_date: Time.current)
          subject.stub(end_date: Time.current - 3.days)

          subject.valid?

          expect(subject.errors[:end_date]).to eq([I18n.t('activerecord.errors.messages.end_date_is_greater_than_start_date')])
        end
      end
    end

    describe "to_s" do
      it 'return title' do
        subject.stub(title: "Primeiro Evento")

        expect(subject.to_s).to eq "Primeiro Evento"
      end
    end
  end
end
