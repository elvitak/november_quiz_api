class Edition < ApplicationRecord
  geocoded_by :city
  has_many :foos
end
