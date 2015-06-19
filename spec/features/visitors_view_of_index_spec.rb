feature "Not signed in user views index" do
  before do
    visit root_path
  end

  scenario "user looking at index, doing nothing" do
    shop1 = Fabricate(:shop)
    shop2 = Fabricate(:shop)
    shop3 = Fabricate(:shop)

    page.has_css?(shop1.name)
    page.has_css?(shop1.machine)
    page.has_css?(shop1.roaster)
    page.has_css?("#{shop1.city}, #{shop1.state}")

    page.has_css?(shop2.name)
    page.has_css?(shop2.machine)
    page.has_css?(shop2.roaster)
    page.has_css?("#{shop2.city}, #{shop2.state}")

    page.has_css?(shop3.name)
    page.has_css?(shop3.machine)
    page.has_css?(shop3.roaster)
    page.has_css?("#{shop3.city}, #{shop3.state}")

  end
end
