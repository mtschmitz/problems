include ApplicationHelper

def sign_up_with_valid_info()
  fill_in "Name",         with: "Example User"
  fill_in "Email",        with: "user@example.com"
  fill_in "user_password",              with: "foobar11"
  fill_in "user_password_confirmation", with: "foobar11"
end
	
RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_alert_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-alert', text: message)
  end
end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-success', text: message)
  end
end

def check_title_and_heading(heading, page_title)
	let(:heading)    { heading }
  let(:page_title) { page_title }
	it_should_behave_like "all static pages"
end

def visit_and_check_static_pages()
	  visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))

    click_link "Home"
    expect(page).to have_title(full_title('Sign Up!'))

##NOTICE: We may need to change this test if we decide to change the 
#title of the program.
    click_link "Problems"
    expect(page).to have_title(full_title(''))
end

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
  else
    visit new_user_session_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Submit"
  end
end
