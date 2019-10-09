class Book < ApplicationRecord
  has_and_belongs_to_many :genre
  has_and_belongs_to_many :author
  belongs_to :format

  validates :name, presence: true
end
