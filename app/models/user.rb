class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :email, :name, presence: true
  validates :email, format: { with: /.+@.+\..+/, message: "must be an email address" }, uniqueness: true
end
