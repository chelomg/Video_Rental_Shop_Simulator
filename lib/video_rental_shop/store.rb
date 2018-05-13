require 'singleton'

module VideoRentalShop
  class Store
    include Singleton

    def initialize
      @current_date = Time.now
      @collection = []
      @history_list = []
      @customer_list = []
    end

    def rentable_videos
      @collection.select { |video| !video.is_rented? }
    end

    def is_rented_videos
      @collection.select { |video| video.is_rented? }
    end

    def videos
      @collection
    end
  end
end
