class Classified < ActiveRecord::Base
  belongs_to :user
  belongs_to :classified_category
  has_many :posters
  has_many :users, through: :posters
  has_many :classified_attachments
  accepts_nested_attributes_for :classified_attachments, reject_if: :all_blank, allow_destroy: true
  mount_uploader :image, AvatarUploader
  validates :title, :description, :email, :city, :address, :amount, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?


  def full_address
  	"#{address} #{city}"	
  end
end
