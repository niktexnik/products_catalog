module Products
  class Show < ActiveInteraction::Base
    integer :id

    def execute
      Product.find_by(id:) || errors.add(:id, 'does not exist')
    end
  end
end
