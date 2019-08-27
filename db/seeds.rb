# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Value.destroy_all
Stock.destroy_all

10.times do
  stock = Stock.new(
    :symbol => Faker::Alphanumeric.unique.alpha(number:4).upcase,
    :name => Faker::Commerce.price(range: 0..100.00),
    :gain => true,
    :current_price => Faker::Commerce.price(range: 0..100.00),
    :daily_open => Faker::Commerce.price(range: 0..100.00),
    :daily_close => Faker::Commerce.price(range: 0..100.00),
    :weekly_open => Faker::Commerce.price(range: 0..100.00),
    :weekly_close => Faker::Commerce.price(range: 0..100.00),
    :monthly_open => Faker::Commerce.price(range: 0..100.00),
    :monthly_close => Faker::Commerce.price(range: 0..100.00),
    :daily_high => Faker::Commerce.price(range: 0..100.00),
    :daily_low => Faker::Commerce.price(range: 0..100.00),
    :weekly_high => Faker::Commerce.price(range: 0..100.00),
    :weekly_low => Faker::Commerce.price(range: 0..100.00),
    :monthly_high => Faker::Commerce.price(range: 0..100.00),
    :monthly_low => Faker::Commerce.price(range: 0..100.00),
    :yearly_high => Faker::Commerce.price(range: 0..100.00),
    :yearly_low => Faker::Commerce.price(range: 0..100.00),
    :volume => (rand(400000) + 200000)
    )
    stock.save

    base_time = Time.now
    counter = 0
    10.times do
      counter += 1
      value = stock.values.new(
        :price => (stock.daily_open - rand(-3)),
        :log_time => base_time + counter.hours
      )
      value.save
    end
  end
