require 'singleton'
require 'video_rental_shop/new_release_video'
require 'video_rental_shop/drama_video'
require 'video_rental_shop/comedy_video'
require 'video_rental_shop/romance_video'
require 'video_rental_shop/horror_video'
require 'video_rental_shop/history'
require 'video_rental_shop/common/loggable'
require 'faker'

module VideoRentalShop
  class Store
    include Singleton
    include VideoRentalShop::Common::Loggable
    attr_reader :history_list, :collection

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

    def rent_video(user_name, rentable_videos, rent_date, due_days)
      puts "#{user_name}: Renting video ..."
      sleep(0.5)
      change_videos_status(rentable_videos)
      create_borrow_record(user_name, rentable_videos, rent_date, due_days)
    end

    def check_in(user_name, rented_videos)
      puts "#{user_name}: Check in video ..."
      sleep(0.5)
      change_videos_status(rented_videos)
    end

    def total_income
      income = 0
      @history_list.each do |history|
        income = income + history.price_amount
      end
      income
    end

    private

    def change_videos_status(videos)
      videos.each do |video|
        video.is_rented = !video.is_rented
        puts "  Video: '#{video.name}', is rented? #{video.is_rented}"
      end
    end

    def create_borrow_record(name, videos, rent_date, due_days)
      total_price = count_videos_price(videos, due_days)
      videos_name = videos.map{ |video| video.name }
      history = History.new(name, videos_name, rent_date, due_days, total_price)
      @history_list << history
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
