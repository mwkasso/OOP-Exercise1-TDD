describe "FamilyMember" do
		describe "Family member should inherit from person" do
			it "FamilyMember inherits from person" do
				familymember = FamilyMember.new "joe", "bloggs", "1 Jan 1990"
				expect(familymember.class < Person).to be true
			end
		end
		describe "Family member should have a relationship status" do
			it "FamilyMember should have an instance variable " do 
				familymember = FamilyMember.new "joe", "bloggs", "1 Jan 1990"
				familymember.relationship = "single"
				expect(familymember.relationship).to eq("single")
			end
		end
	end