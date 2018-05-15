require "video_rental_shop/customer"

module VideoRentalShop
  class Hoarder < Customer

    def initialize(id, name)
      super(id, name, [3, 3], [7, 7])
    end

    def get_data
    end
  end
end
