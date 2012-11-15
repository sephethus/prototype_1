require 'spec_helper'



describe "StaticPages" do

	subject { page }

	describe "Test layout." do

		before { visit root_path }

		it { should have_selector('title', text: full_title('Home')) }
		it { should have_selector('h1', text: "TEST") }
	end

end
