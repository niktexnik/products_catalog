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
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
