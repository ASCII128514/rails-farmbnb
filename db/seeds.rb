# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
a = User.new
a.openId = 'oObcN5CBQcd4mwsWpIoi1SUb8aVU'
a.name = 'carly'
a.description = 'carly is testing'
a.save

b = Product.new
b.product_name = 'potato'
b.product_price = '100'
b.unit = 'kg'
b.user = a
b.picture_url = 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4266087431,2209117257&fm=200&gp=0.jpg'
b.save
