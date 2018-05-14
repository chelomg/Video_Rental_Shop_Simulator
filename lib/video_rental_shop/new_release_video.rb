require "video_rental_shop/video"

module VideoRentalShop
  class NewReleaseVideo < Video
    def initialize(name)
      super(name, 150)
    end
  end
end
