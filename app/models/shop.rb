class Shop < ActiveRecord::Base
  belongs_to :user

  validates :name, :city, :state, :machine, :roaster, :address, presence: true
  validates :state, length: { is: 2 }

  mount_uploader :image, ImageUploader

  scope :state, -> (state) { where state: state }

  geocoded_by :full_address

  def full_address
    [address, city, state].compact.join(', ')
  end
  after_validation :geocode
end
