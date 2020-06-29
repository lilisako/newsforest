# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

rm = RestClient.get "http://newsapi.org/v2/everything?q=business&from=#{Time.new.strftime("%Y-%m-%d")}&sortBy=popularity&apiKey="+ENV['API_KEY']
rm_array = JSON.parse(rm)["articles"]

rm_array.each do |news|
  Post.create(
      title: news["title"],
      content: news["description"],
      user_id: 1,
      url: news["url"],
      urlToImage: news["urlToImage"].nil? ? "https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80": news["urlToImage"],
      publishedAt: news["publishedAt"],
    )
end