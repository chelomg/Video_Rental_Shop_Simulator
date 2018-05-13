require 'singleton'
require 'video_rental_shop/new_release_video'
require 'video_rental_shop/drama_video'
require 'video_rental_shop/comedy_video'
require 'video_rental_shop/romance_video'
require 'video_rental_shop/horror_video'
require 'faker'

module VideoRentalShop
  class Store
    include Singleton

    def initialize
      @current_date = Time.now
      @history_list = []
      @customer_list = []
      create_videos
    end

    def create_videos
      @collection = []
      video_category = [NewReleaseVideo, DramaVideo, ComedyVideo, RomanceVideo, HorrorVideo]
      20.times do
        @collection << video_category.sample.new(Faker::Movie.quote)
      end
      p @collection
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
