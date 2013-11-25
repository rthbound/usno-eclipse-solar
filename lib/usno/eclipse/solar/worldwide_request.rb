require "uri"
require "net/http"

module USNO
  module Eclipse
    module Solar
      class WorldWideRequest < PayDirt::Base
        include USNO::Eclipse::Solar::Request

        def initialize(options = {})
          options = {
            z_meters: 0,
            days: 5,
            lat_minutes: 0, lat_seconds: 0, long_minutes: 0, long_seconds: 0
          }.merge(options)


          load_options(:long, :lat, :date, options)
        end

        def call
          return result(true, request_response.body)
        end

        private
        def place
          %W{
            place=#{ @place || @city || "None given" }
            #{elevation}
            #{coordinates}
          }.join("&")
        end

        def elevation
          "hh1=#{@z_meters}"
        end

        def coordinates
          %W{
            xx0=#{ sign_of(@long) }
            xx1=#{ @long.abs }
            xx2=#{ @long_minutes }
            xx3=#{ @long_seconds }
            yy1=#{ @lat.abs }
            yy2=#{ @lat_minutes }
            yy3=#{ @lat_seconds }
            yy0=#{ sign_of(@lat) }
          }.join("&")
        end

        def sign_of(int)
          int.zero? ? int.next : int / int.abs
        end

        def request_body
          %W{
            FFX=2
            #{place}
            xxecl=#{USNO::Eclipse::Solar::Eclipses.fetch(@date)}
            ZZZ=END
          }.join("&")
        end
      end
    end
  end
end
