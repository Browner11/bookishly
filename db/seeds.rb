# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.destroy_all

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'book_data.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  # convert to string first to bypass 'undefined method split for nil' error
  book_genres = row['genres'].to_s.split('|')
  book_genres.each do |genre|
    Genre.find_or_create_by(name: genre)
  end
end

puts Genre.count
