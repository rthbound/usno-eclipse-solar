module USNO
  module Eclipse
    module Solar
      module States
        def self.states
          {
            "Alabama"              => "AL", "Alaska"         => "AK", "American Samoa" => "AS",
            "Arizona"              => "AZ", "Arkansas"       => "AR", "California"     => "CA",
            "Colorado"             => "CO", "Connecticut"    => "CT", "Delaware"       => "DE",
            "District of Columbia" => "DC", "Florida"        => "FL", "Georgia"        => "GA",
            "Guam"                 => "GU", "Hawaii"         => "HI", "Idaho"          => "ID",
            "Indiana"              => "IN", "Iowa"           => "IA", "Kansas"         => "KS",
            "Kentucky"             => "KY", "Louisiana"      => "LA", "Maine"          => "ME",
            "Maryland"             => "MD", "Massachusetts"  => "MA", "Michigan"       => "MI",
            "Minnesota"            => "MN", "Mississippi"    => "MS", "Missouri"       => "MO",
            "Montana"              => "MT", "Nebraska"       => "NE", "Nevada"         => "NV",
            "New Hampshire"        => "NH", "New Jersey"     => "NJ", "New Mexico"     => "NM",
            "New York"             => "NY", "North Carolina" => "NC", "North Dakota"   => "ND",
            "N. Mariana Islands"   => "MP", "Ohio"           => "OH", "Oklahoma"       => "OK",
            "Oregon"               => "OR", "Pennsylvania"   => "PA", "Puerto Rico"    => "PR",
            "Rhode Island"         => "RI", "South Carolina" => "SC", "South Dakota"   => "SD",
            "Tennessee"            => "TN", "Texas"          => "TX", "Utah"           => "UT",
            "Vermont"              => "VT", "Virgin Islands" => "VI", "Virginia"       => "VA",
            "Washington"           => "WA", "West Virginia"  => "WV", "Wisconsin"      => "WI",
            "Wyoming"              => "WY", "Illinois"       => "IL"
          }
        end

        def self.by_key_or_value(kv)
          states.has_value? kv and return kv
          states.fetch(kv) { raise "USNO State not recognized" }
        end
      end
    end
  end
end
