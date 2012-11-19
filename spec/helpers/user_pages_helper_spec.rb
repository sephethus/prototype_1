require 'spec_helper'

def valid_signup
	fill_in "Name",         with: "Example User"
	fill_in "Email",        with: "user@example.com"
	fill_in "Password",     with: "foobar"
	fill_in "Confirmation", with: "foobar"
end