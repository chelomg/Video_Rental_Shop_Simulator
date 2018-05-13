require "video_rental_shop/customer"

module VideoRentalShop
  class BreezyCustomer < Customer

    def initialize(name)
      super(name)
      @rented_range = [1, 2]
      @due_day_range = [1, 2]
    end

    def get_data
    end
  end
end
