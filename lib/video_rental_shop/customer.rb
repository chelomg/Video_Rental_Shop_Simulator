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
      return false if @rented_range[1] - rented_videos_num < 1
      true
    end

    def rent_video
      can_rented_range = [@rented_range[0], @rented_range[1] - rented_videos_num].sort

      today_rented_num = rand(can_rented_range[0]..can_rented_range[1])
      today_rented_videos = Store.instance.rentable_videos.sample(today_rented_num)
      due_day = rand(@due_day_range[0]..@due_day_range[1])

      @rented_list << Rental.new(today_rented_videos, due_day)
      Store.instance.rent_video(@name, today_rented_videos, Date.today, due_day)

      p "#{Time.now} #{self.class.name.split('::').last} #{@name} rented #{today_rented_videos.size} videos for #{due_day}"
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
