require 'spec_helper'



describe "StaticPages" do

	subject { page }

	describe "Test layout." do

		before { visit root_path }

		it { should have_selector('title', text: full_title('Home')) }

	end

end
