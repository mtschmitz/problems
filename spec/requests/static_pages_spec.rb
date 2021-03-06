require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    check_title_and_heading('Moblems', '')

    it { should_not have_title('| Home') }
    it "should have Join now button" do
      expect(page).to have_selector("div","Join now!")
    end

    describe "for signed in users" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }
      it { should have_alert_notice('Signed in') } 
    end

  end

  describe "Help page" do
    before { visit help_path }
	  check_title_and_heading('FAQ','Help')
  end

  describe "About page" do
    before { visit about_path }
	  check_title_and_heading('PROBLORM','About Us')
  end

#There is no contact page currently. If we wish to add one, we 
#should uncomment this test.
=begin
  describe "Contact page" do
    before { visit contact_path }
	check_title_and_heading('Contact','Contact')
  end
=end
  it "should have the right links on the layout" do
    visit_and_check_static_pages()
  end


end
