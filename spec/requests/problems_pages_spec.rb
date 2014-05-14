require 'spec_helper'

describe "Problems" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  let(:submit) { "Create Problem" }  

  describe "posting new problems" do
    describe "while not logged in" do
      before { visit new_problem_path }
      it { should have_title('Sign In') }
      it { should have_alert_message('You need to sign in or sign up before continuing.') }
    end    

    describe "after logging in" do
      before do
        sign_in user 
        visit new_problem_path
      end

      it { should have_title('New Problem') }

#This test may not be needed
#      it "should not create a problem post" do
#        expect{ click_button submit }.to_not change(Problems, :count) 
#      end

      describe "with missing information" do
        before { click_button submit }
        it { should have_title('New Problem') }
        it { should have_error_message('error') }
      end
      
      describe "with valid information" do
        before do
          fill_in "problem_name",         with: "Forsit problem name"
          fill_in "problem_description",  with: "Forsit problem description."
          click_button submit
        end
        
        it { should have_title('Moblems') }
      end      

    end
  end

end
