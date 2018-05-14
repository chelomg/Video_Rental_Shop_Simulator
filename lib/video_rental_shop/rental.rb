require "date"

module VideoRentalShop
  class Rental

    def initialize(video_list, due_days)
      @video_list = video_list
      @rent_date = Date.today
      @due_days = due_days
    end

    def get_videos
      @video_list
    end

    def is_dued?
      (Date.today - @rent_date).to_i >= @due_days
    end
  end
end
