module Favourites
  class Create < ActiveInteraction::Base
    integer :product_id, :user_id

    def execute
      favourite || favourite.errors
    end

    def favourite
      @favourite ||= Favourite.create(inputs)
    end
  end
end
