require "video_rental_shop/video"

module VideoRentalShop
  class HorrorVideo < Video
    def initialize(name)
      super(name, 130)
    end
  end
end
