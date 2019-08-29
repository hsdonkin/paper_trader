
# _Paper Trader_
![Main Page](/app/assets/images/signup.png)
#### _Project for Week 16 at the coding school, Epicodus, written on August 29, 2019._

#### By _**Josh Mabry, Hugh Donkin, Tae Lee, and Alex Siegberg**_

## Description
_This app tracks real stocks in real-time and allows users to buy and sell stocks with fake currency. There's a leaderboard to track which user has profited the most from their stock purchases. The technologies we utilized was Ruby on Rails, JavaScript and Postgres with the Alpha Vantage API service for real-time stock information.

_MVP Goals
- View the price of a stock over time
- View prices of many stocks over time
- View a graph indicating the relative stock price
- Track a portfolio of many stocks over time
- "Buy" and "Sell" stocks of your portfolio
- Indicate relevant stats about your portfolio
- Leaderboards showing increases and decreases in portfolio (edited)

## Setup/Installation Requirements
* _For demonstration only,_
* _locate this address (http://floating-scrubland-71604.herokuapp.com/) on your browser._
&nbsp;
* _For local deployment_
* _Clone this repository_
* _Open terminal and type 'git clone [git link]'_
* _Navigate to project directory using cd in terminal_
* _Open project in text editor (atom .)_
* _Type 'bundle install' in terminal to load Gems_
* _postgres DB installation with sql script in project_
* _rake db:create_
* _rake db:migrate_
* _rake db:seed_
* _rails s_
* _open browser and locate localhost:3000_

* _For database,
* _in order to backup, please execute followings in terminal,_
* _pg_dump [YOUR DATABASE NAME] > database_backup.sql_
* _for database restore after clone, please execute followings in terminal_
* _createdb [DATABASE NAME]_
* _psql [DATABASE_NAME] < database_backup.sql_
* _createdb -T [DATABASE NAME] [TEST DATABASE NAME]_

## Known Bugs
_No known bugs_

## Support and contact details
_Please contact us if you have any issues at: mabry1985@gmail.com_

## Technologies Used
* Ruby 2.5.1
* Rails 5.2.3
* Postgres DB 10.5
* JavaScript ES6
* Heroku 7.29
* Gems (turbolinks, jbuilder, dotenv-rails, rest-client, sass-rails, devise, money, alphavantagerb, faker ...)
* API information for real stock market from Alpha Vantage (https://www.alphavantage.co/)

### License
_This software is licensed under MIT license._

Copyright (c) 2019 **Josh Mabry, Hugh Donkin, Tae Lee, and Alex Siegberg**
