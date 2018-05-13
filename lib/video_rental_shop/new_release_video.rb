require "video_rental_shop/video"

module VideoRentalShop
  class NewReleaseVideo < Video
    def initialize(name)
      super(name)
      @price = 5
    end
  end
end
