# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.page params[:page]
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @booksearch = Book.joins(:author).where("books.name LIKE ? OR authors.name LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%")
  end
end
