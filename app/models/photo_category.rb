class PhotoCategory < ActiveRecord::Base
  has_many :photos
end
