module Products
  class ProductSerializer < BaseSerializer
    attributes :id, :name, :description, :full_description, :updated_at, :url

    private

    def url
      object.image_url
    end
  end
end
