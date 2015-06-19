def signin_as(user)
  click_on "Sign In"
  fill_in "Email", with: user.email
  fill_in "Password", with: "password1"
  click_button "Sign In"
  page.should have_content("Welcome Back, #{user.name}!")
end
