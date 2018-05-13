module VideoRentalShop
  class BreezyCustomer < Customer

    def initialize
      super
      @rented_range = [1, 2]
      @due_day_range = [1, 2]
    end

    def get_data
    end
  end
end
