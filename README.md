# Near Earth Objects

A near earth object is any undefined cosmic body whose orbit brings it within
a specific proximity of earth. NASA records these NEOs daily and makes the
information available through a free api available [here](https://api.nasa.gov/api.html#NeoWS)

The purpose of the Near Earth Objects app is to organize the data from NASA's api in order to give
it more meaning.

*Endpoints

  There is one main endpoint which takes two dates that can be no more than
  seven days apart.

`https://neos-neos-neos.herokuapp.com/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12`

  Using this endpoint you can attach two different queries which are sort and filter.

  example:

`/api/v1/neo?start_date=2018-12-6&end_date=2018-12-12&filter=hazard&sort=miss_distance`

  The filter query only filters hazardous NEOs so by setting filter=hazard you
  will get a list of the NEOs which NASA considers to be threatening to Earth.

  The sort query takes four different options:

      *sort=magnitude will return the collection of NEOs ordered from highest magnitude to
      lowest
      *sort=speed will return the collection of NEOs ordered from highest speed to
      lowest
      *sort=diameter will return the collection of NEOs ordered from largest to
      smallest width
      *sort=miss_distance will return the collection of NEOs ordered from nearest to
      furthest proximity of Earth.

  So a query such as filter=hazard&sort=miss_distance will give you the NEO
  which is considered dangerous and was the closest to Earth for the time span
  you provided.


If you wish to update or change this API for your own application you'll need `Ruby version 2.4.1`.
You'll also need to register for an API key from NASA. In order to use
this key properly you'll have to utilize the figaro gem which is already
included in the gemfile.
After you fork and clone the repository simply run `bundle` and then follow
the instructions [here](https://github.com/laserlemon/figaro) to secure
your NASA API key in your app. Once you do this you should be ready to run
'rails s' or 'rspec' in order to see if the app is working properly on your machine.
