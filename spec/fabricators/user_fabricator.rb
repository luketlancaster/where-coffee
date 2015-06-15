Fabricator(:user) do
  id               1
  email            { Faker::Internet.email }
  password         "password1"
  admin            false
  name             { Faker::Name.name }
end
