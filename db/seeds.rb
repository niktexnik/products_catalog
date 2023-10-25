# add admin user
FactoryBot.create(:admin)
# add classic users
10.times do
  FactoryBot.create(:user)
end

# Add products
150.times do
  FactoryBot.create(:product)
end
