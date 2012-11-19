require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "signup" do

		let(:submit) { "Join" }
		before { visit signup_path }


		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				valid_signup
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end			
	end
end