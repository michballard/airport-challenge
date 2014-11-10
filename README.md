| [Makers Academy](http://www.makersacademy.com) | Week 3 | Friday Challenge |
| ------ | ------ | ------ |

<a href="https://codeclimate.com/repos/5460eb0fe30ba028940161f8/feed"><img src="https://codeclimate.com/repos/5460eb0fe30ba028940161f8/badges/ead37b52191437cb9955/gpa.svg" /></a>

Airport
=======

The aim of this challenge is to model the flow of planes in an airport.  This used a set of classes/modules and used doubles for testing.  

Functionality
-------------
- A plane can take off and land
- A random weather generator can set the weather
- An airport can tell a plane whether it can take off or land, depending on the airport's capacity and current weather

Technologies used
-----------------
- Ruby
- Rspec

Testing
-------
Screenshot of test results from terminal:

![Screenshot](/images/screenshot.png)

How to run it
-------------

Clone the repository:
```shell
$ git clone git@github.com:michballard/airport-challenge.git
```

Change directory:
```shell
$ cd airport-challenge/
```

Open up IRB and require file:
```shell
> require './run_airport.rb'
```

####Methods available in this project

To create new objects:
```shell
> plane = Plane.new
> airport = Airport.new
```

For a plane to take off:
```shell
> plane.take_off!
```

For a plane to land:
```shell
> plane.land!
```

To land a plane at an airport:
```shell
> airport.accept(plane)
```

To release a plane from airport:
```shell
> airport.release(plane)
```

To check status of a plane:
```shell
> plane.plane_status  # can either be flying or landed
```

To check capacity of airport:
```shell
> airport.capacity  # gives total capacity
> airport.planes  # lists all planes currently landed at airport
> airport.full?
> airport.empty?
```

To check weather:
```shell
> airport.weather  # can either be sunny or stormy
```
