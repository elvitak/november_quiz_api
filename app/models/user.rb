class User < ApplicationRecord
  geocoded_by :address
end
