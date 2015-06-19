Fabricator(:user) do
  email            { Faker::Internet.email }
  admin            false
  name             { Faker::Name.name }
  password              "password1"
  password_confirmation "password1"
end
