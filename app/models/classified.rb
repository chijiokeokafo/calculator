class Classified < ActiveRecord::Base
belongs_to :user
has_many :posters
has_many :users, through: :posters

mount_uploader :picture, AvatarUploader

end
