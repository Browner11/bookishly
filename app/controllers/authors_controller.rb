class AuthorsController < ApplicationController
  def index
    @authors = Author.all # This instance vaariable will be shared with the view
  end

  def show
    @author = Author.find(params[:id])
  end
end
