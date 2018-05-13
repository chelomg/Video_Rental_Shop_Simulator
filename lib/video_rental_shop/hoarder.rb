module VideoRentalShop
  class Hoarder < Customer

    def initialize
      super
      @rented_range = [3, 3]
      @due_day_range = [7, 7]
    end

    def get_data
    end
  end
end
