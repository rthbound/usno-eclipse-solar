# USNO::Eclipse::Solar [![Code Climate](https://codeclimate.com/github/rthbound/usno-eclipse-solar.png)](https://codeclimate.com/github/rthbound/usno-eclipse-solar)[![Coverage Status](https://coveralls.io/repos/rthbound/usno-eclipse-solar/badge.png?branch=master)](https://coveralls.io/r/rthbound/usno-eclipse-solar?branch=master)[![Build Status](https://travis-ci.org/rthbound/usno-eclipse-solar.png?branch=master)](https://travis-ci.org/rthbound/usno-eclipse-solar)

Obtain the circumstances of recent and upcoming solar eclipses for any location

## Installation

Add this line to your application's Gemfile:

    gem 'usno-eclipse-solar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install usno-eclipse-solar

## Usage

First, `require usno/eclipse/solar`

By default, it'll check for the visibility data of the solar eclipse occurring on August 21, 2017.
A location is always required.

![August 21, 2017](http://aa.usno.navy.mil/data/docs/ats_0412017.gif)

```ruby
USNO::Eclipse::Solar::Data.new(lat: 30, long: -87).call.data
```

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Solar Eclipse Computer</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<pre>
                          Solar Eclipse of 2017 Aug. 21                         
                     Sun in Partial Eclipse at this Location                    
                                 Delta T:  69.4s                                
     
                          None given                                            
                Location:  W 87°00'00.0", N30°00'00.0",     0m                
                   (Longitude referred to Greenwich meridian)                   
     
                                             Sun's           Position     Vertex
                          UT1         Altitude   Azimuth      Angle       Angle
                      d  h  m   s         °          °           °           °
   Eclipse Begins    21 17:04:27.5      68.9      146.7       304.2       333.4
   Maximum Eclipse   21 18:36:42.3      69.0      212.7
   Eclipse Ends      21 20:03:14.2      54.4      246.5       105.7        51.6
     
               Duration:   2h 58m 46.7s
              Magnitude:   0.840
            Obscuration:  80.5%
</pre>

<p><a href="javascript:history.go(-1)">Back to form</a></p>
</body>
</html>
```

```ruby
USNO::Eclipse::Solar::Data.new(request_class: USNO::Eclipse::Solar::USRequest, city: "Gulf Shores", state: "Alabama", date: Time.new(2017,8,21)).call.data
```
```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Solar Eclipse Computer</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<pre>
                          Solar Eclipse of 2017 Aug. 21                         
                     Sun in Partial Eclipse at this Location                    
                                 Delta T:  69.4s                                
     
                              GULF SHORES, ALABAMA                              
                Location:  W 87°41'24.0", N30°15'36.0",     0m                
                   (Longitude referred to Greenwich meridian)                   
     
                                             Sun's           Position     Vertex
                          UT1         Altitude   Azimuth      Angle       Angle
                      d  h  m   s         °          °           °           °
   Eclipse Begins    21 17:02:33.5      68.1      144.4       304.1       335.2
   Maximum Eclipse   21 18:34:44.6      69.3      209.5
   Eclipse Ends      21 20:01:35.1      55.1      245.0       105.6        52.5
     
               Duration:   2h 59m 01.7s
              Magnitude:   0.838
            Obscuration:  80.2%
</pre>

<p><a href="javascript:history.go(-1)">Back to form</a></p>
</body>
</html>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
