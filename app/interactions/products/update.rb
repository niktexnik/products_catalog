module Products
  class Update < ActiveInteraction::Base
    integer :id
    string :name, default: nil
    string :description, default: nil
    string :full_description, default: nil
    file :image, default: nil

    validate :check_blank_attributes

    def execute
      product.update(prepared_attributes)
      product if product.valid?
    end

    private

    def product
      @product ||= Product.find(id)
    end

    def prepared_attributes
      @prepared_attributes ||= { name:, description:, full_description:, image: }.compact
    end

    def check_blank_attributes
      errors.add(:error, 'Attributes can\'t be blank!') if inputs.values.include?('')
    end
  end
end
