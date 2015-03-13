class ClassifiedAttachment < ActiveRecord::Base
  belongs_to :classified
  mount_uploader :picture, AvatarUploader
end
