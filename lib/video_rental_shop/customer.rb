require "video_rental_shop/store"
require "video_rental_shop/rental"

module VideoRentalShop
  class Customer
    attr_reader :name

    def initialize(id, name, rented_range = [1, 1], due_day_range = [1, 1])
      @id = id
      @name = name
      @rented_list = []
      @rented_range = rented_range
      @due_day_range = due_day_range
    end

    def can_rent_video?
      return false if @rented_range[1] <= rented_videos_num
      true
    end

    def rent_video
      raise NotImplementedError, "subclass did not define #rent_viedo"
    end

    private

    def rented_videos_num
      num = 0
      @rented_list.each do |rental|
        num = num + rental.get_videos.size unless rental.is_dued?
      end
      num
    end

    def create_rental
    end
  end
end
