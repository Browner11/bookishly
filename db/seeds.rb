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

  book_authors = row['book_authors'].to_s.split('|')
  book_authors.each do |author|
    Author.find_or_create_by(name: author)
  end

  book_formats = row['book_format'].to_s.split('|')
  book_formats.each do |format|
    Format.find_or_create_by(name: format)
  end
end

puts "Genres added: #{Genre.count}"
puts "Authors added: #{Author.count}"
puts "Formats added: #{Format.count}"
