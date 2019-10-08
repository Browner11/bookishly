# frozen_string_literal: true

class FormatsController < ApplicationController
  def index
    @formats = Format.all # This instance vaariable will be shared with the view
  end
end
