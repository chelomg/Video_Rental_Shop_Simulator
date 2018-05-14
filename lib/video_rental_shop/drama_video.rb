require "video_rental_shop/video"

module VideoRentalShop
  class DramaVideo < Video
    def initialize(name)
      super(name, 120)
    end
  end
end
