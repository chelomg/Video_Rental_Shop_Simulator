module VideoRentalShop
  class Video
    attr_reader :price, :name

    def initialize(name, price = 0)
      @price = price
      @name = name
      @is_rented = false
      @due_date = Time.now
    end

    def is_rented?
      @is_rented
    end
  end
end
