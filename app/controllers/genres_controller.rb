# frozen_string_literal: true

class GenresController < ApplicationController
  def index
    @genres = Genre.all # This instance vaariable will be shared with the view
  end
  # The associated view is auto-magically loaded with access to the @vars
  # index action maps to: app/views/houses/index.html.erb
end
