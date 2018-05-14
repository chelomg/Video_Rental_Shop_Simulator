require "video_rental_shop/customer"

module VideoRentalShop
  class Hoarder < Customer

    def initialize(id, name)
      super(id, name, [3, 3], [7, 7])
    end

    # override
    def can_rent_video?
      return false if rented_videos_num > 0
      true
    end

    def rent_video
      can_rented_range = [@rented_range[0], @rented_range[1]].sort

      today_rented_num = rand(can_rented_range[0]..can_rented_range[1])
      today_rented_videos = Store.instance.rentable_videos.sample(today_rented_num)

      due_day = rand(@due_day_range[0]..@due_day_range[1])
      @rented_list << Rental.new(today_rented_videos, due_day)
      p "#{Time.now} #{self.class.name.split('::').last} #{@name} rented #{today_rented_videos.size} videos for #{due_day}"
    end

    def get_data
    end
  end
end
