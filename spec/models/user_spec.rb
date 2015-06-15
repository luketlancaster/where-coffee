require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_confirmation_of(:password) }
    it { should validate_presence_of(:password).on(:create) }
    it { should_not validate_presence_of(:password).on(:update) }
    it { should validate_presence_of(:password_confirmation).on(:create) }
    it { should_not validate_presence_of(:password_confirmation).on(:update) }
    it "should allow valid values for email" do
      should allow_value("luke@lancaster.com", "1@2.co.uk", "luke+lan@caster.com").for(:email)
    end
    it "should be invalid if email is incorrectly formatted" do
      it { should_not allow_value("luke.com").for(:email) }
      it { should_not allow_value("luke@lancastercom").for(:email) }
      it { should_not allow_value("@.com").for(:email) }
    end
    it "should have a working fabricator" do
      Fabricate.build(:user).should be_valid
    end
  end
end
