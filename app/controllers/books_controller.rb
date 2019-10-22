# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.page params[:page]
  end

  def show
    @book = Book.find(params[:id])
  end

  def search
    @booksearch = Book.where("name LIKE ?", "%" + params[:q] + "%")
  end
end
