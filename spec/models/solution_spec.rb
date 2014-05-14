require 'spec_helper'

describe Solution do
  let(:user) { FactoryGirl.create(:user) }
  let(:problem) { FactoryGirl.create(:problem)}
  
  before {
     @problem = user.problems.build(name: "Hungry Children", id: 1 , description: "there are children starving in america? What to do") 
     @solution = user.solutions.build(name: "Food", plan: "feed them with food", problem_id: @problem.id) 
     }

  subject { @solution }

  it { should respond_to(:name) }
  it { should respond_to(:plan) }
  it { should respond_to(:result) }
  it { should respond_to(:user_id) }
  it { should respond_to(:problem_id) }
  it { should respond_to(:attempted) }
  
  its(:user) { should eq user }
  its(:problem) { should eq problem}

  it { should be_valid }

  describe "when user_id is not present" do
    before { @solution.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when problem_id is not present" do
    before { @solution.problem_id = nil }
    it { should_not be_valid }
  end

  describe "with blank plan section" do
    before { @solution.plan = " " }
    it { should_not be_valid }
  end

  describe "with a plan that is too long" do
    before { @solution.plan = "a" * 2002 }
    it { should_not be_valid }
  end
end
