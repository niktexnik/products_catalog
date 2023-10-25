module Favourites
  class Destroy < ActiveInteraction::Base
    integer :id

    def execute
      product.destroy
      head 204
    end

    def product
      @product ||= Product.find(id)
    end
  end
end
