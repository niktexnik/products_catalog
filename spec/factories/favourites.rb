FactoryBot.define do
  factory :favourite do
    user_id { FactoryBot.create(:user).id }
    product_id { FactoryBot.create(:product).id }
  end
end
