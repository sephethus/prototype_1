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
				fill_in "Name",         with: "Example User"
				fill_in "Email",        with: "user@example.com"
				fill_in "Password",     with: "foobar"
				fill_in "Confirmation", with: "foobar"				
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				it { should have_link('Sign out') }

				describe "followed by signout" do
        			before { click_link "Sign out" }
        			it { should have_link('Sign in') }
     			end
			end			
		end			
	end
end