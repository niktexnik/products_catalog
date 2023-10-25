class UserAdmin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(_auth_object = nil)
    %w[admin auth_token confirmation_sent_at confirmation_token confirmed_at created_at email
       encrypted_password id name remember_created_at reset_password_sent_at reset_password_token
       unconfirmed_email updated_at]
  end
end
