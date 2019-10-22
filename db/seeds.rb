# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Genre.destroy_all
Author.destroy_all
Format.destroy_all
Page.destroy_all

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'book_data.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  book = Book.new
  book.name = row['book_title']
  book.num_pages = row['book_pages']

  # convert to string first to bypass 'undefined method split for nil' error
  if row['genres'].nil?
    g = Genre.find_or_create_by(name: 'Novels')
    book.genre_ids << g.id
  else
    book_genres = row['genres'].to_s.split('|')
    book_genres.each do |genre|
      g = Genre.find_or_create_by(name: genre)
      book.genre_ids = book.genre_ids << g.id
    end
  end

  book_authors = row['book_authors'].to_s.split('|')
  book_authors.each do |author|
    a = Author.find_or_create_by(name: author,
                                 address: Faker::Address.full_address)
    book.author_ids = book.author_ids << a.id
  end

  book_formats = row['book_format'].to_s.split('|')
  book_formats.each do |format|
    f = Format.find_or_create_by(name: format)
    book.format_id = f.id
  end

  book.image = row['image_url']

  book.save
  puts "#{book.name} saved."
end

Page.create(title: 'About Us', content: 'Please fill this in.', permalink: 'about-us')

puts "Genres added: #{Genre.count}"
puts "Authors added: #{Author.count}"
puts "Formats added: #{Format.count}"
puts "Books added: #{Book.count}"
