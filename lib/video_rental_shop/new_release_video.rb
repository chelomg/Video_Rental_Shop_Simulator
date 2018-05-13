module VideoRentalShop
  class NewReleaseVideo < Video
    def initialize
      super
      @price = 5
    end
  end
end
