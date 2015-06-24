class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, :name, presence: true
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }, uniqueness: true
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: { on: :create }

  mount_uploader :photo, ImageUploader
end
