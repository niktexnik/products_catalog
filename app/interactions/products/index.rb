module Products
  class Index < ActiveInteraction::Base
    integer :page, default: 1
    integer :limit, default: 50
    string :sorting_field, default: 'id'
    string :sorting_order, default: 'asc'

    validates :sorting_field, inclusion: { in: %w[id name description] }
    validates :sorting_order, inclusion: { in: %w[asc desc] }

    def execute
      paginated_products
    end

    private

    def paginated_products
      return products.page(page) if limit.nil?

      products.page(page).limit(limit)
    end

    def products
      @products = ::Product.order("#{sorting_field} #{sorting_order.upcase} NULLS LAST")
    end
  end
end
