require 'faker'

User.seed(
  :id,
  (2..100).to_a.map do |id|
    {
      id: id,
      name: Faker::Name.name,
      email: Faker::Internet.email
    }
  end
)
