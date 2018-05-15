require 'singleton'
require 'observer'
require 'video_rental_shop/store'
require 'video_rental_shop/breezy_customer'
require 'video_rental_shop/hoarder'
require 'video_rental_shop/regular_customer'
require 'faker'
require 'timecop'

module VideoRentalShop
  class Simulator
    include Singleton
    include Observable

    def initialize
      @current_date = Date.today
      @max_number_of_customer = 5
      @prng = Random.new
      @start_date = Date.today
    end

    def run
      create_customer
      @store = Store.instance

      35.times do
        Timecop.freeze(@current_date)
        start_new_day
        @current_date += 1
      end
    end

    private

    def start_new_day
      p "Daily check status"
      notify_customers
      p "#{@current_date} start!"
      @number_of_customer_will_come = @prng.rand(@max_number_of_customer)
      p "Today have #{@number_of_customer_will_come} customers will come to video rental shop"

      loop do
        if check_inventory
          if @number_of_customer_will_come > 0
            customer = random_customer
            if customer.can_rent_video?
              @number_of_customer_will_come -= 1
              customer.rent_video
            else
              p "customer #{customer.name} can't rent videos!"
            end
          else
            p "no customer will come today!"
            break
          end
        else
          p "no video can be rented today!"
          break
        end
      end
    end

    def create_customer
      customer_categories = [BreezyCustomer, Hoarder, RegularCustomer]
      @customers = []
      10.times do |i|
        customer = customer_categories.sample.new(i, Faker::Name.name)
        @customers << customer
        add_observer(customer, :check_rental_deadline)
      end
      #p @customers
    end

    def update_data
    end

    def check_inventory
      @store.rentable_videos.any?
    end

    def random_customer
      @customers.sample
    end

    def notify_customers
      changed
      notify_observers
    end
  end
end
