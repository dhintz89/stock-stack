# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Dan Hintz', username: 'dhintz', password: 'pass')
securities = Security.create([{symbol: 'CRM', companyName: 'SalesForce', changePercent: 0.0009}, {symbol: 'SREV', companyName: 'ServiceSource', changePercent: 3.025}])
watchlists = Watchlist.create([{name: 'IPOWatch', description: 'Interesting upcoming IPOs', user_id: 1, security_id: 1}, {name: 'IPOWatch', description: 'Interesting upcoming IPOs', user_id: 1, security_id: 2}, {name: 'Other', description: 'Other stocks to watch', user_id: 1, security_id: 2}])
