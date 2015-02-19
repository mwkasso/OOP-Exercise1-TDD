require 'spec_helper'

describe "FamilyMember" do
  let(:familymember) {familymember = FamilyMember.new "joe", "bloggs", "1 Jan 1990"}
    describe "Family member should inherit from person" do
      it "FamilyMember inherits from person" do
        expect(familymember.class < Person).to be true
      end
    end
    describe "Family member should have a relationship status" do
      it "FamilyMember should have an instance variable " do 
        familymember.relationship = "single"
        expect(familymember.relationship).to eq("single")
      end
    end
end