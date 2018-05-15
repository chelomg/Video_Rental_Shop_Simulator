require "video_rental_shop/customer"

module VideoRentalShop
  class BreezyCustomer < Customer

    def initialize(id, name)
      super(id, name, [1, 2], [1, 2])
    end

    def get_data
    end
  end
end
