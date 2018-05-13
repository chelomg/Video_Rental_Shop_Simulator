module VideoRentalShop
  class RegularCustomer < Customer

    def initialize
      super
      @rented_range = [1, 3]
      @due_day_range = [3, 5]
    end

    def get_data
    end
  end
end
