require 'singleton'
require 'video_rental_shop/store'

module VideoRentalShop
  class Simulator
    include Singleton

    def initialize
      @current_data = Time.now
    end

    def run
      @store = Store.instance

      loop do
        #p @store
      end
    end

    private

    def update_data
    end

    def check_inventory
    end

    def random_customer
    end
  end
end
