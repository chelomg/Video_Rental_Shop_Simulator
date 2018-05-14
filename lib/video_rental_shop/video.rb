module VideoRentalShop
  class Video
    def initialize(name)
      @title = name
      @is_rented = false
      @due_date = Time.now
    end

    def is_rented?
      @is_rented
    end
  end
end
