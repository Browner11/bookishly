class Book < ApplicationRecord
  has_and_belongs_to_many :genre
  has_and_belongs_to_many :author
  belongs_to :format

  paginates_per 24

  validates :name, presence: true
end
