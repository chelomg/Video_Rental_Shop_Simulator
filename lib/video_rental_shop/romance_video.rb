require "video_rental_shop/video"


module VideoRentalShop
  class RomanceVideo < Video
    def initialize(name)
      super(name)
      @price = 4
    end
  end
end
