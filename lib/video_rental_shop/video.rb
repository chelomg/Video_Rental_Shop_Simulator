module VideoRentalShop
  class Video
    def initialize
      @title = ""
      @is_rented = false
      @due_date = Time.now
    end
  end
end
