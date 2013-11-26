module USNO
  module Eclipse
    module Solar
      class Data < PayDirt::Base
        def initialize(options = {})
          options = form_options(options)

          load_options(:date, options) and validate_state
        end

        def call
          result true, @request_class.new(@request_options).call.data
        end

        private
        def form_options(options)
          options = {
            request_class: USNO::Eclipse::Solar::WorldWideRequest,
            z_meters:      0,           # Default: sea level
            date: Time.new(2017, 8, 21) # Default: 2017 total eclipse
          }.merge(options)

          options.merge!({
            request_options: options.reject do |k,_|
              k.to_s == "request_class"
            end
          })
        end

        def validate_state
          @z_meters.between?(-90, 10999) or raise %q{
            Elevation (z_meters) out of range
          } # Documented by USNO, but won't fail

          (@city && @state) || (@lat && @long) or raise %q{
            Location required.
          }
        end
      end
    end
  end
end
