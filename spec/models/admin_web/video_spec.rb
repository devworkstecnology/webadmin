require 'rails_helper'

module AdminWeb
  RSpec.describe Video, :type => :model do
    context "Validations" do
      it { should validate_presence_of :description }
      it { should validate_presence_of :link }
    end

    describe "to_s" do
      it 'return description' do
        subject.stub(description: "Primeiro Video")

        expect(subject.to_s).to eq "Primeiro Video"
      end
    end

    describe "extract_id" do
      it 'return hash link' do
        subject.stub(:link).and_return 'http://youtube.com/v=video_teste'

        expect(subject.extract_id).to eq 'video_teste'
      end
    end
  end
end
