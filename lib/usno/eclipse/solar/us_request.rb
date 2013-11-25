require "uri"
require "net/http"

module USNO
  module Eclipse::Solar
    class USRequest < PayDirt::Base
      include USNO::Eclipse::Solar::Request

      def initialize(options = {})
        options = {
        }.merge(options)

        load_options(:city, :state, :date, options)
      end

      def call
        return result(true, request_response.body)
      end

      private
      def place
        "st=#{USNO::Eclipse::Solar::States.by_key_or_value(@state)}&place=#{@city}&hh1=#{@z_meters}"
      end



      def request_body
        %W{
          FFX=1
          xxecl=#{USNO::Eclipse::Solar::Eclipses.fetch(@date)}
          #{place}
          ZZZ=END
        }.join("&")
      end
    end
  end
end
