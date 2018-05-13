require 'singleton'
require 'video_rental_shop/store'
require 'video_rental_shop/breezy_customer'
require 'video_rental_shop/hoarder'
require 'video_rental_shop/regular_customer'
require 'faker'

module VideoRentalShop
  class Simulator
    include Singleton

    def initialize
      @current_data = Time.now
      @max_number_of_customer = 5
      @prng = Random.new
    end

    def run
      create_customer
      @store = Store.instance

      @number_of_customer_will_come = @prng.rand(@max_number_of_customer)
      p "Today have #{@number_of_customer_will_come} will come to video rental shop"

      loop do
        if @number_of_customer_will_come > 0
          random_customer
          @number_of_customer_will_come -= 1
        end
        #p @store
      end
    end

    private

    def create_customer
      customer_categories = [BreezyCustomer, Hoarder, RegularCustomer]
      @customers = []
      10.times do
        @customers << customer_categories.sample.new(Faker::Name.name)
      end
      p @customers
    end

    def update_data
    end

    def check_inventory
    end

    def random_customer
      p @customers.sample
    end
  end
end
