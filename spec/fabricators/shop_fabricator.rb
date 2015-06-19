Fabricator(:shop) do
  state           { Faker::Address.state_abbr }
  city            { Faker::Address.city }
  name            { Faker::Company.name }
  machine         { Faker::Lorem.word.capitalize }
  roaster         { Faker::App.name }
  ppc             2.22
  multi           false
end
