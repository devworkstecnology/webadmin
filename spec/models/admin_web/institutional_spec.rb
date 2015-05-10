require 'rails_helper'

module WebAdmin
  RSpec.describe Institutional, :type => :model do
    context "Validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :body }
    end

    describe "to_s" do
      it 'return name' do
        subject.stub(name: "Primeiro Post")

        expect(subject.to_s).to eq "Primeiro Post"
      end

    end
  end
end
