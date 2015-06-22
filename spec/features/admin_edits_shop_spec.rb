feature "Admin edits shop" do
  let(:luke) { Fabricate(:user, admin: true) }
  let(:notluke) { Fabricate(:user) }

  scenario "non admin can't edit" do
    visit root_path
    signin_as notluke
    page.should_not have_link("Edit")
  end

  scenario "Admin edits shop" do
    shop = Fabricate(:shop)
    visit root_path
    signin_as luke
    click_on "Edit"
    field_labeled("Name").value.should == shop.name
    field_labeled("Machine").value.should == shop.machine
    field_labeled("Roaster").value.should == shop.roaster
    field_labeled("City").value.should == shop.city
    fill_in "Name", with: "Crema"
    fill_in "Machine", with: "PB"
    fill_in "Roaster", with: "Crema"
    check "Batch?"
    check "BTC?"
    fill_in "City", with: "Nashville"
    select("TN", :from => "State")
    select("2", :from => "PPC")
    click_button "Save Shop"
    page.should have_content("Thanks for the update!")
    current_path.should == root_path
    page.should have_content("Crema")
    page.should have_content("PB")
    page.should have_content("Crema")
    page.should have_content("Nashville")
    page.should have_content("TN")
  end

  scenario "Admin edits a shop sad path" do
    shop = Fabricate(:shop)
    visit root_path
    signin_as luke
    click_on "Edit"
    field_labeled("Name").value.should == shop.name
    field_labeled("Machine").value.should == shop.machine
    field_labeled("Roaster").value.should == shop.roaster
    field_labeled("City").value.should == shop.city
    fill_in "Name", with: ""
    fill_in "Machine", with: ""
    fill_in "Roaster", with: ""
    check "Batch?"
    check "BTC?"
    fill_in "City", with: ""
    select("TN", :from => "State")
    select("2", :from => "PPC")
    click_button "Save Shop"
    page.should have_error("can't be blank", on: "Name")
    page.should have_error("can't be blank", on: "Machine")
    page.should have_error("can't be blank", on: "Roaster")
    page.should have_error("can't be blank", on: "City")
    fill_in "Name", with: "Crema"
    fill_in "Machine", with: "PB"
    fill_in "Roaster", with: "Crema"
    fill_in "City", with: "Nashville"
    click_button "Save Shop"
    page.should have_content("Thanks for the update!")
    current_path.should == root_path
  end
end
