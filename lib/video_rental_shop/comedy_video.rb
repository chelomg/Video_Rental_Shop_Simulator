require "video_rental_shop/video"

module VideoRentalShop
  class ComedyVideo < Video
    def initialize(name)
      super(name, 110)
    end
  end
end
