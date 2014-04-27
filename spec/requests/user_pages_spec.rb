require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit new_user_registration_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "signup" do

    before { visit new_user_registration_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

#The type of errors that occurs for the sign up form is it notifies which field
#has the error. This test looks for a popup message. We will have to change this
#test or add new features to test errors properly.
=begin
      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
=end
    end

    describe "with valid information" do
      before { sign_up_with_valid_info() }

      it "should create a user" do


        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }


#Don't expect a welcome message if one doesn't exist
#        it { should have_success_message('Welcome') }
      end
    end
  end
end
