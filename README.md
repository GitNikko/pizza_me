# PIZZA ME

**Welcome to PizzaMe!**

PizzaMe is a dedicated pizza search engine for pizza enthusiasts all over the country.\ 
Please find the live site here: https://pizza-me-now.herokuapp.com

**Installation -**

ruby => 2.5.0p0
To run this app locally, clone the repo and run '$bundle install' to add necessary dependencies.

Create a '.env' file in the working directory and add the following API keys:

FACEBOOK_KEY=<insert_key_here>\
FACEBOOK_SECRET=<insert_secret_here>\

GOOGLE_CLIENT_ID=<your_google_client_id_here>\
GOOGLE_SECRET=<your_google_secret_here>\

YELP_KEY=<your_yelp_api_key>\
(Please note this app only works with the Yelp Fusion v3 api, NOT v2)

To obtain these keys please use the following links:\
https://www.yelp.com.au/fusion\
https://developers.facebook.com\
https://console.developers.google.com/\

DO NOT commit your '.env' file to git! Add this file to '.gitignore' to keep your api keys safe.

**Usage -** 

PizzaMe is good to go straight out of the box! Seacrh queries will hit the Yelp api and return a list of results. 
The first time you click on a new result, the restaurant will be added to the database and referenced by the 'yelp_id'.
Future visits to this restaurant will retrieve the restaurant from the database along with any reviews that have been added.

Photos uploaded in reviews use the 'Carrierwave' gem and will be locally stored in '/public/uploads'. It is advised to add this folder to your '.gitignore' file also.

**Customization -**

To customize the Yelp api settings or default values, you can edit the 'yelp_setup.rb' module located in app/models/

**Testing -** 

This application uses MINITEST. To run the test suite run 'rails test'

**Conclusion/Contribution -**

PizzaMe is a portfolio application.
Please contact me for any comments or contributions.

**ENJOY!** 
