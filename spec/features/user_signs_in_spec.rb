feature "User signs in" do
  before do
    visit root_path
    click_on "Sign In"
  end

  scenario "Returning user signs in" do
    user = Fabricate(:user, name: "Zaphod")
    fill_in "Email", with: user.email
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome Back, Zaphod!")
    page.should_not have_content("Sign In")
    page.should_not have_content("Sign Up")
    page.should have_content("Sign Out")
    click_on "Sign Out"
    page.should have_content("Thanks, come back soon!")
    page.should have_content("Sign In")
    page.should have_content("Sign Up")
    page.should_not have_content("Sign Out")
  end

  scenario "Returning user signs in with wrong password" do
    user = Fabricate(:user, name: "Trillian")
    fill_in "Email", with: user.email
    fill_in "Password", with: "passwerd1"
    click_button "Sign In"
    page.should have_content("We could not sign you in. Please check your email/password and try again.")
    page.should_not have_content("Create your account")
    page.should_not have_content("Password confirmation")
    field_labeled("Email").value.should == user.email
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("Welcome Back, Trillian!")
  end

  scenario "Returning user signs in with wrong email" do
    Fabricate(:user, email: "ford@prefect.com")
    fill_in "Email", with: "not@real.com"
    fill_in "Password", with: "password1"
    click_button "Sign In"
    page.should have_content("We could not sign you in. Please check your email/password and try again.")
  end

  scenario "User signs in with empty fields" do
    click_button "Sign In"
    page.should have_content("We could not sign you in. Please check your email/password and try again.")
  end
end

