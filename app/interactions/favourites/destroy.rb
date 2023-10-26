module Favourites
  class Destroy < ActiveInteraction::Base
    integer :id, :user_id

    def execute
      favourite.is_a?(Favourite) ? favourite.destroy : errors.add(:error, 'You can\'t remove it from favourite')
    end

    def favourite
      Favourite.where(product_id: id, user_id:).last
    end
  end
end
