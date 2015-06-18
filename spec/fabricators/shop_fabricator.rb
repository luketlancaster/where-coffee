Fabricator(:shop) do
  state           { Faker::Address.state_abbr }
  city            { Faker::Address.city }
  name            { Faker::Lorem.word }
  machine         { Faker::Lorem.word }
  roaster         { Faker::App.name }
  ppc             2.22
  multi           false
end
