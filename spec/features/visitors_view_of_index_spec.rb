feature "Not signed in user views index" do
  before do
    visit root_path
  end

  scenario "user looking at index, doing nothing" do
    shop1 = Fabricate(:shop)

    page.has_css?(shop1.name)
    page.has_css?(shop1.machine)
    page.has_css?(shop1.roaster)
    page.has_css?("#{shop1.city}, #{shop1.state}")
  end

  scenario "user clicks on help tab" do
    click_on "Help"
    page.should have_content("Machine used")
    page.should have_content("Who roasts the coffee")
    page.should have_content("City/State")
    page.should have_content("Average price-per-cup")
    page.should have_content("Last time the shop was updated")
    page.should have_content("Offers By the Cup")
    page.should have_content("Offers batch-brew (fetco, bunn, etc)")
    page.should have_content("If you would like to be an admin")
  end
end
