require "video_rental_shop/customer"

module VideoRentalShop
  class RegularCustomer < Customer

    def initialize(name)
      super(name)
      @rented_range = [1, 3]
      @due_day_range = [3, 5]
    end

    def get_data
    end
  end
end
