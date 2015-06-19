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
end
