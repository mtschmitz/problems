require 'spec_helper'

describe Problem do
  let(:user) { FactoryGirl.create(:user) }
  before { @problem = user.problems.build(name: "Hungry Children", description: "there are children starving in america? What to do") }

  subject { @problem }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @problem.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @problem.description = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @problem.description = "a" * 2002 }
    it { should_not be_valid }
  end
end
