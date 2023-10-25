module Products
  class Show < ActiveInteraction::Base
    integer :id

    def execute
      Product.find(id)
    end
  end
end
