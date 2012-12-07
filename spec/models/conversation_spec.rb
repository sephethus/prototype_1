require 'spec_helper'

describe Conversation do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @conversation = user.conversations.new(subject: "Lorem Ipsum", content: "Lorem ipsum") }

  subject { @conversation }

  it { should respond_to(:subject) }
  it { should respond_to(:content) }  
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @conversation.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Conversation.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "with content that is too long" do
    before { @conversation.content = "a" * 3001 }
    it { should_not be_valid }
  end

  describe "with empty content" do
    before { @conversation.content = nil }
    it { should_not be_valid }
  end

  describe "with subject too long" do
    before { @conversation.subject = "a" * 81 }
    it { should_not be_valid }
  end

  describe "with empty subject" do
    before { @conversation.subject = nil }
    it { should_not be_valid }
  end
end
