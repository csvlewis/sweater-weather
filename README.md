[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# Sweater Weather

Sweater Weather is an API service that is intended to work as the backend for a weather application. Users can make requests to forecast and background endpoints to get weather forecasts and images for a given location. Visitors can create an account by making a request to a registration endpoint to receive an api key, which can be retrieved later through a login endpoint. 

Once a user has an api key, they can use it to create or delete favorite locations. A user’s favorite locations along with forecast information for each can be retrieved by sending a request to the favorites endpoint with the user’s api key.

# Prerequisites

- Requires PostgreSQL database

# Getting Started


Clone the project and enter the directory

    git clone https://github.com/csvlewis/sweater-weather.git
    cd sweater-weather

Bundle and migrate the database

    bundle
    rake db:migrate

Start the server locally

    rails s

Next, install Figaro to create a config/application.yml file:

    bundle exec figaro install

You will need to get API keys for the [Google Maps API](https://developers.google.com/maps/documentation/geocoding/get-api-key), [Dark Sky API](https://darksky.net/dev/register), and the [Unsplash API](https://unsplash.com/developers). Once you have the keys, add them to your config/application.yml file:

    GOOGLE_MAPS_API_KEY: key_goes_here
    DARK_SKY_API_KEY: key_goes_here
    UNSPLASH_API_KEY: key_goes_here

Now you can access any of the application’s endpoints through http requests using an application like [Postman](https://www.getpostman.com/).

# API Endpoints

All images in this section are screenshots from the Postman app.
All the request urls in the images are accessing the app hosted on Heroku. To test the same endpoints locally, replace ‘https://morning-cliffs-21879.herokuapp.com' in the request url with ‘http://localhost:3000'.

Also, all requests sent should have the headers of ‘Content-Type’ and ‘Accept’, each with a value of ‘application/json’: ![Default Headers](/images/general_headers.png?raw=true)

A weather forecast for a city can be accessed by sending a GET request to the forecast endpoint with the city as a parameter: ![Forecast Request](/images/forecast_request.png?raw=true)

A background image for a city can be accessed by sending a GET request to the background endpoint with the city as a parameter: ![Background Request](/images/background_request.png?raw=true)

A user account can be created by sending a POST request to the users endpoint with a body containing a JSON hash with the user’s email, password, and password_confirmation:

The response to this request will be the user’s unique API key, which they will need to save, view, or delete favorite locations:

A user who has created an account can access their API key by sending a POST request to the sessions endpoint with a body containing their email and password: 
The response to this request will be the given user’s API key.

A user can save a favorite location by sending a POST request to the favorites endpoint with a body containing the location and their api key:

A user can delete a favorite location by sending a DELETE request to the favorites endpoint with a body containing the location and their api key:

Finally, a user can get a list of favorite locations and a forecast for each by sending a GET request to the favorites endpoint with a body containing their api key:

Also, all requests sent should have the headers of ‘Content-Type’ and ‘Accept’, each with a value of ‘application/json’: ![Default Headers](/images/general_headers.png?raw=true)


