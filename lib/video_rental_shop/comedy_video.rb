require "video_rental_shop/video"

module VideoRentalShop
  class ComedyVideo < Video
    def initialize(name)
      super(name)
      @price = 1
    end
  end
end
