require 'rails_helper'

module WebAdmin
  RSpec.describe Post, :type => :model do
    context "Validations" do
      it { should validate_presence_of :user_id }
      it { should validate_presence_of :user }
      it { should validate_presence_of :title }
      it { should validate_presence_of :body }
    end

    context "Relationships" do
      it { should belong_to :user }
    end

    describe "to_s" do
      it 'return title' do
        subject.stub(title: "Primeiro Post")

        expect(subject.to_s).to eq "Primeiro Post"
      end

    end
  end
end
