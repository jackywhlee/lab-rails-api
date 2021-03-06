class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors
  has_many :reviews
  validates :title, presence: true
end
