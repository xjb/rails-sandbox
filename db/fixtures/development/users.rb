require 'faker'

User.seed(
  :id,
  (2..100).to_a.map do |id|
    {
      id: id,
      name: Faker::Name.name,
      email: Faker::Internet.email,
      role: User.roles.keys.sample,
      prefecture_id: Faker::Number.within(range: 1..47)
    }
  end
)
