class BooksController < ApplicationController
  def index
    @books = Book.all # This instance vaariable will be shared with the view
  end
end
