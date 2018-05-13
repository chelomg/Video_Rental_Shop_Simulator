require "video_rental_shop/video"

module VideoRentalShop
  class DramaVideo < Video
    def initialize(name)
      super(name)
      @price = 2
    end
  end
end
