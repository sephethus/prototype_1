require 'spec_helper'

describe Reply do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @reply = user.replies.new(content: "Lorem ipsum") }

  subject { @reply }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @reply.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Reply.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "with content that is too long" do
    before { @reply.content = "a" * 1001 }
    it { should_not be_valid }
  end
end
