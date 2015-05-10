require 'rails_helper'

module WebAdmin
  RSpec.describe User, :type => :model do
    context "Relatioships" do
      it { should have_many :posts }
      it { should have_many :permissions }
    end

    describe "#to_s" do
      it 'return email' do
        subject.stub(email: "rodrigo@email.com")

        expect(subject.to_s).to eq "rodrigo@email.com"
      end
    end
  end
end
