feature "Not signed in user views index" do
  before do
    skip
    visit root_path
  end

  scenario "user looking at index, doing nothing" do
    shop1 = Fabricate(:shop)
    shop1.save
    shop2 = Fabricate(:shop)
    shop2.save
    shop3 = Fabricate(:shop)
    shop3.save

    page.should have_css("h2", shop1.name)
    page.should have_css("p", shop1.machine)
    page.should have_css("p", shop1.roaster)
    page.should have_css("p", "#{shop1.city}, #{shop1.state}")
    page.should have_css("p", "PPC: #{shop1.ppc}")
    page.should have_css("p", "Last Updated: #{time_ago_in_words(shop1.updated_at)} ago")


    page.should have_css("h2", shop2.name)
    page.should have_css("p", shop2.machine)
    page.should have_css("p", shop2.roaster)
    page.should have_css("p", "#{shop2.city}, #{shop2.state}")
    page.should have_css("p", "PPC: #{shop2.ppc}")
    page.should have_css("p", "Last Updated: #{time_ago_in_words(shop2.updated_at)} ago")


    page.should have_css("h2", shop3.name)
    page.should have_css("p", shop3.machine)
    page.should have_css("p", shop3.roaster)
    page.should have_css("p", "#{shop3.city}, #{shop3.state}")
    page.should have_css("p", "PPC: #{shop3.ppc}")
    page.should have_css("p", "Last Updated: #{time_ago_in_words(shop3.updated_at)} ago")

  end
end
