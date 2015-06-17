class Shop < ActiveRecord::Base
  belongs_to :user

  validates :name, :city, :state, :machine, :roaster, presence: true
  validates :state, length: { is: 2 }
end
