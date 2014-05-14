require 'spec_helper'

describe "Solutions" do
  subject { page }
  let(:user) { FactoryGirl.build(:user) }
  let(:problem) { FactoryGirl.build(:problem) } 

  describe "in problem display" do
    before do
      problem.id = 1
      problem.save!
      visit problem_path(problem) 
    end
    
    it "should have solution button" do
      expect(page).to have_selector("div", "Solutions?")
    end
  end
end
