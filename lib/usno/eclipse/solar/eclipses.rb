module USNO
  module Eclipse
    module Solar
      module Eclipses
        def self.by_key_or_value(kv)
          hash.has_value? kv and return kv

          hash.fetch(formatted_date(kv)) {
            raise "No known solar eclipse at the provided time #{kv} - hint, try USNO::Eclipse::Solar::Eclipses.all"
          }.to_s
        end

        def self.fetch(kv)
          by_key_or_value(kv)
        end

        def self.hash
          {
            "200827"  => 12008, "20111125" => 42011, "2015320"  => 12015,
            "200881"  => 22008, "2012520"  => 12012, "2015913"  => 22015,
            "2009126" => 12009, "2012521"  => 12012, "201638"   => 12016,
            "2009721" => 22009, "20121113" => 22012, "201639"   => 12016,
            "2009722" => 22009, "20121114" => 22012, "201691"   => 22016,
            "2010115" => 12010, "201359"   => 12013, "2017226"  => 12017,
            "2010711" => 22010, "2013510"  => 12013, "2017821"  => 22017,
            "201114"  => 12011, "2013113"  => 22013, "20141023" => 22014,
            "201161"  => 22011, "2014429"  => 12014, "201171"   => 32011
          }
        end

        def self.formatted_date(date)
          date.kind_of?(String) ? date : date.strftime("%Y%-m%-d")
        end

        # As reminders
        def self.all
          %w{
            2008 February 7 (Annular)
            2008 August 1 (Total)
            2009 January 26 (Annular)
            2009 July 21-22 (Total)
            2010 January 15 (Annular)
            2010 July 11 (Total)
            2011 January 4 (Partial)
            2011 June 1 (Partial)
            2011 July 1 (Partial)
            2011 November 25 (Partial)
            2012 May 20-21 (Annular)
            2012 November 13-14 (Total)
            2013 May 9-10 (Annular)
            2013 November 3 (Total)
            2014 April 29 (Annular)
            2014 October 23 (Partial)
            2015 March 20 (Total)
            2015 September 13 (Partial)
            2016 March 8-9 (Total)
            2016 September 1 (Annular)
            2017 February 26 (Annular)
            2017 August 21 (Total)
          }
        end
      end
    end
  end
end
