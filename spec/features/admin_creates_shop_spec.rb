feature "Admin creates shop" do

  background do
    visit root_path
    signin_as Fabricate(:user, admin: true)
  end

  scenario "Admin creates new shop" do
    click_on "Add"
    fill_in "Name", with: "Higher Grounds"
    fill_in "Machine", with: "LineaPB"
    fill_in "Roaster", with: "Counter Culture"
    check "Multi-Roaster"
    check "Drip"
    fill_in "City", with: "Chatty-Chatty-Noog-Noog"
    select("TN", :from => "state")
    select("2.25", :from => "PPC")
    click_button "Add Shop"
    page.should have_content("Thank you!")
    current.path.should == root_path
    page.should have_content("Higher Grounds")
  end

  scenario "Admin creates shop, messes up" do
    click_on "Add"
    fill_in "Name", with: ""
    fill_in "Machine", with: ""
    fill_in "Roaster", with: ""
    fill_in "City", with: ""
    click_button "Add Shop"
    page.should have_error("can't be blank", on: "Name")
    page.should have_error("can't be blank", on: "Machine")
    page.should have_error("can't be blank", on: "Roaster")
    page.should have_error("can't be blank", on: "City")
    fill_in "Name", with: "Higher Grounds"
    fill_in "Machine", with: "LineaPB"
    fill_in "Roaster", with: "Counter Culture"
    fill_in "City", with: "Chatty-Chatty-Noog-Noog"
    select("TN", :from => "state")
    select("2.25", :from => "PPC")
    click_button "Add Shop"
    page.should have_content("Thank you!")
    current.path.should == root_path
    page.should have_content("Higher Grounds")
  end
end
