Given /^a user visits the signin page$/ do
  visit new_user_session_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-alert')
end

Given /^the user has an account$/ do
  @user = User.create(email: "user@example.com",
                      password: "foobar11", password_confirmation: "foobar11")
end

Given /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^he should see the home page again$/ do
  page.should have_selector('title', text: "Problems")
end

Then /^he should see a signout link$/ do
  page.should have_link('Sign out', href: signout_path)
end