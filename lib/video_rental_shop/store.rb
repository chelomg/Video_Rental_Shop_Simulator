require 'singleton'
require 'video_rental_shop/new_release_video'
require 'video_rental_shop/drama_video'
require 'video_rental_shop/comedy_video'
require 'video_rental_shop/romance_video'
require 'video_rental_shop/horror_video'
require 'video_rental_shop/history'
require 'faker'

module VideoRentalShop
  class Store
    include Singleton

    def initialize
      @current_date = Date.today
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
      #p @collection
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

    def rent_video(user, rentable_videos, rent_date, due_days)
      p "renting video ..."
      change_videos_status(rentable_videos)
      create_borrow_record(user, rentable_videos, rent_date, due_days)
    end

    def check_in(rented_videos)
      p "check in video ..."
      change_videos_status(rented_videos)
    end

    private

    def change_videos_status(videos)
      videos.each do |video|
        video.is_rented = !video.is_rented
        p "video #{video.name}, is_rented? #{video.is_rented}"
      end
    end

    def create_borrow_record(name, videos, rent_date, due_days)
      total_price = count_videos_price(videos, due_days)
      videos_name = videos.map{ |video| video.name }
      history = History.new(name, videos_name, rent_date, due_days, total_price)
      history.show
    end

    def count_videos_price(videos, due_days)
      price = 0
      videos.each do |video|
        price = price + video.price * due_days
      end
      price
    end
  end
end
