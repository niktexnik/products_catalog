# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  auth_token             :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  admin                  :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User_#{n}_#{Time.current.to_i}" }
    sequence(:email) { |n| "email#{n}@l-tex.com" }
    password { '12345678' }
    admin { false }

    trait :admin do
      sequence(:name) { |n| "admin#{n}" }
      admin { true }
    end

    factory :admin, traits: [:admin]
  end
end
