module Products
  class Update < ActiveInteraction::Base
    integer :id
    string :name, default: nil
    string :description, default: nil
    string :full_description, default: nil
    string :image, default: nil

    def execute
      product.update(prepared_attributes)
      product
    end

    private

    def product
      @product ||= Product.find(id)
    end

    def prepared_attributes
      { name:, description:, full_description:, image: }.compact
    end
  end
end
