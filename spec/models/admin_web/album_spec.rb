require 'rails_helper'

module WebAdmin
  RSpec.describe Album, :type => :model do
    context "Validations" do
      it { should validate_presence_of :title }
      it { should validate_presence_of :date }
      it { should validate_presence_of :local }
    end

    describe "to_s" do
      it 'return title' do
        subject.stub(title: "Primeiro Post")

        expect(subject.to_s).to eq "Primeiro Post"
      end

    end
  end
end
