module Favourites
  class Destroy < ActiveInteraction::Base
    integer :id, :user_id

    def execute
      favourite.is_a?(Favourite) ? favourite.destroy : errors.add(:base, 'You can\'t remove it from favourite')
    end

    private

    def favourite
      Favourite.where(product_id: id, user_id:).last
    end
  end
end
