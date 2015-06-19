feature "New User Sings Up" do
  background do
    visit root_path
    click_on "Sign Up"
  end

  scenario "User signs up" do
    fill_in "Name", with: "Zaphod"
    fill_in "Email", with: "zaphod@beeblebrox.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_button "Create Account"
    page.should have_content("Thanks for signing up, Zaphod!")
    current_path.should == root_path
    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: "zaphod@beeblebrox.com"
    fill_in "Password", with: "123"
    click_button "Sign In"
    page.should have_content("Welcome Back, Zaphod!")
  end

  scenario "Sad path signing up" do
    fill_in "Name", with: ""
    fill_in "Email", with: "zaphodbeeblebrox.com"
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: "123"
    click_button "Create Account"

    page.should have_error("can't be blank", on: "Name")
    page.should have_error("must be an email address", on: "Email")
    page.should have_error("can't be blank", on: "Password")
    page.should have_error("doesn't match Password", on: "Password confirmation")

    fill_in "Name", with: "Zaphod"
    fill_in "Email", with: "zaphod@beeblebrox.com"
    fill_in "Password", with: "123"
    fill_in "Password confirmation", with: "123"
    click_button "Create Account"

    page.should have_content("Thanks for signing up, Zaphod!")
  end
end
