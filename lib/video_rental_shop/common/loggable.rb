require 'video_rental_shop'

module VideoRentalShop
  module Common
    module Loggable
      def logger
        VideoRentalShop.logger.progname = self.progname
        VideoRentalShop.logger
      end

      def progname
        @progname ||= ("%-10s" % display_name)
      end

      def display_name
        self.class.to_s.split(":")[-1]
      end
    end
  end
end
