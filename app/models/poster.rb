class Poster < ActiveRecord::Base
  belongs_to :user
  belongs_to :classified
end
