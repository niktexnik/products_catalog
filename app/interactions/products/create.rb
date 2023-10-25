module Products
  class Create < ActiveInteraction::Base
    string :name, :description, :full_description
    file :image

    def execute
      product || product.errors
    end

    def product
      @product ||= Product.create(inputs)
    end
  end
end
