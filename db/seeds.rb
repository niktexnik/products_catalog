# add classic users
10.times do
  FactoryBot.create(:user)
end

# create admin user
FactoryBot.create(:user_admin)

# Add products
150.times do
  FactoryBot.create(:product)
end
