require 'spec_helper'

describe "Solutions" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  let(:problem) { FactoryGirl.create(:problem) }
  let(:submit) { "Create Solution" }  

  describe "posting new solutions" do
    describe "while not logged in" do
      before { visit new_problem_solution_path(problem) }
      it { should have_title('Sign In') }
      it { should have_alert_message('You need to sign in or sign up before continuing.') }
    end    

    describe "after logging in" do
      before do
        sign_in user 
        visit new_problem_solution_path(problem)
      end

      it { should have_title('New Solution') }

#This test may not be needed
#      it "should not create a problem post" do
#        expect{ click_button submit }.to_not change(Problems, :count) 
#      end

      describe "with missing information" do
        before { click_button submit }
        it { should have_title('New Solution') }
        it { should have_error_message('error') }
      end
      
      describe "with valid information" do
        before do
          fill_in "Name",         with: "Forsit solution name"
          fill_in "Plan",  with: "Forsit solution description."
          click_button submit
        end
        
       it { should have_title('Moblems') }
      end     
    end
  end

end
