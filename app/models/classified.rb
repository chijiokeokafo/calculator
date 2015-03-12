class Classified < ActiveRecord::Base
belongs_to :user
mount_uploader :picture, AvatarUploader
end
