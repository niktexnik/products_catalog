# == Schema Information
#
# Table name: products
#
#  id               :bigint           not null, primary key
#  name             :string
#  description      :string
#  full_description :string
#  image            :string
#  sort_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :favourites, dependent: :destroy

  validates :name, :description, :image, :full_description, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at description full_description id image name updated_at]
  end
end
