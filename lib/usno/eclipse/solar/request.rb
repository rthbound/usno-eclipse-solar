require "uri"
require "net/http"

module USNO
  module Eclipse
    module Solar
      module  Request
        private
        def request_response(url = "http://aa.usno.navy.mil/cgi-bin/aa_solecl.pl")
          uri = URI.parse(url)

          response = Net::HTTP.start(uri.host) do |http|
            request = Net::HTTP::Post.new(uri.path)

            http_headers.map { |k, v| request[k] = v }
            request.body = request_body

            http.request request
          end
        end

        def http_headers
          {
            "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
            "Accept-Language" => "en-US,en;q=0.5",
            "Accept-Encoding" => "gzip,deflate,sdch",
            "Referer" => "http://aa.usno.navy.mil/data/docs/SolarEclipses.php"
          }
        end
      end
    end
  end
end

