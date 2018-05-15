require "video_rental_shop/customer"

module VideoRentalShop
  class RegularCustomer < Customer

    def initialize(id, name)
      super(id, name, [1, 3], [3, 5])
    end

    def get_data
    end
  end
end
