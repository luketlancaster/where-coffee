require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_length_of(:state).is(2) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:machine) }
    it { should validate_presence_of(:roaster) }
  end

  it "should have a working fabricator" do
    Fabricate.build(:shop).should be_valid
  end

end
