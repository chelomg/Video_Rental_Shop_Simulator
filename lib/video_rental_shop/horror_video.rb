require "video_rental_shop/video"

module VideoRentalShop
  class HorrorVideo < Video
    def initialize(name)
      super(name)
      @price = 3
    end
  end
end
