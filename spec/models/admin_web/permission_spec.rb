require 'rails_helper'

module WebAdmin
  RSpec.describe Permission, :type => :model do
    context "Relatioships" do
      it { should belong_to :user }
    end

    context "Validations" do
      it { should validate_presence_of :model }
      it { should validate_presence_of :permission_type }
    end
  end
end
