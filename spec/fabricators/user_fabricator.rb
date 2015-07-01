Fabricator :user do
  provider    "twitter"
  uid         Faker::Number.number(10)
  secret      Faker::Internet.password(40)
  token       Faker::Internet.password(40)
end
