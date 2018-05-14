require 'rails_helper'

RSpec.describe User, type: :model do
	#methods of shouldaMatchers
	it { should validate_presence_of :username}
	it { should validate_uniqueness_of :username}
	#it { should validate_lenght_of (:username).is_at_least(3).is_at_most(12)}
	describe "#validate_username_regex" do
		let (:user){FactoryBot.build(:user)}
		it "should not allow username with numbers at the beginning" do
			
			user.username = "9sdkjfgnd"
			expect(user.valid?).to be_falsy
		end
		it "should not contain special characters" do
			user.username = "adfa*"
			expect(user.valid?).to be_falsy
		end
	end
end
