module Products
  class Create < ActiveInteraction::Base
    string :name, :description, :full_description
    file :image

    validates :name, :description, :full_description, :image, presence: true

    def execute
      Product.create(inputs)
    end
  end
end
