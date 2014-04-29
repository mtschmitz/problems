require 'spec_helper'

describe "Authentication" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }

  describe "signin page" do
    before { visit new_user_session_path }


    describe "while not signed in" do
      it { should_not have_link('Edit profile', href:  edit_user_registration_path) }
      it { should_not have_link('Logout', href: destroy_user_session_path) }
      it { should have_link('Login', href: new_user_session_path) }
    end

    describe "with invalid information" do
      before { click_button "Sign in" }
      
      it { should have_title('Sign in') }
      it { should have_alert_message('Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_alert_message('Invalid') }
      end
    end

    describe "with valid information" do

      before { sign_in user }

     # it { should have_title(user.name) }
      it { should have_link('Edit profile', href: edit_user_registration_path) }
      it { should have_link('Logout', href: destroy_user_session_path) }
      it { should_not have_link('Login', href: new_user_session_path) }

      describe "followed by signout" do
        before { click_link "Logout" }
        it { should have_link('Login') }
      end
    end
  end
end
