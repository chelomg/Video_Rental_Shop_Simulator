require "video_rental_shop/video"


module VideoRentalShop
  class RomanceVideo < Video
    def initialize(name)
      super(name, 140)
    end
  end
end
