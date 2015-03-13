class Classified < ActiveRecord::Base
  belongs_to :user
  has_many :posters
  has_many :users, through: :posters
  has_many :classified_attachments
  accepts_nested_attributes_for :classified_attachments
end
