require "video_rental_shop/version"
require "video_rental_shop/simulator"
require "video_rental_shop/logger"

module VideoRentalShop
  def self.logger
    @logger ||= VideoRentalShop::Logger.new(STDOUT)
  end
end
