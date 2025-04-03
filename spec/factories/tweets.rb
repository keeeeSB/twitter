FactoryBot.define do
  factory :tweet do
    content { "railsなう。" }
    association :user
  end
end
