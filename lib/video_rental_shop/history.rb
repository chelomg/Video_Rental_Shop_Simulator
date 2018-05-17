require "video_rental_shop/common/loggable"

module VideoRentalShop
  class History
    include VideoRentalShop::Common::Loggable
    attr_reader :price_amount

    def initialize(name, video_list, rent_date, due_days, price_amount)
      @customer = name
      @video_list = video_list
      @rent_date = rent_date
      @due_days = due_days
      @price_amount = price_amount
    end

    def show
      logger.info "Histoy: #{ @customer } rentaled #{@video_list} form #{ @rent_date } for #{ @due_days }, and total price is #{ @price_amount }"
    end

    def record
      "#{ @customer } rentaled videos: #{@video_list} form #{ @rent_date } for #{ @due_days }, and total price is #{ @price_amount }"
    end
  end
end
