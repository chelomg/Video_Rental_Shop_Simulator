require "video_rental_shop/customer"

module VideoRentalShop
  class Hoarder < Customer

    def initialize(id, name)
      super(id, name)
      @rented_range = [3, 3]
      @due_day_range = [7, 7]
    end

    def get_data
    end
  end
end
