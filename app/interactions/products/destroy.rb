module Products
  class Destroy < ActiveInteraction::Base
    integer :id

    def execute
      product.destroy
    end

    def product
      @product ||= Product.find(id)
    end
  end
end
