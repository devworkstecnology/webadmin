require 'rails_helper'

module AdminWeb
  RSpec.describe Image, :type => :model do
    context "Relationships" do
      it { should belong_to :album }
    end

    context "Validations" do
      it { should validate_presence_of :album }
      it { should validate_presence_of :image }
    end
  end
end
