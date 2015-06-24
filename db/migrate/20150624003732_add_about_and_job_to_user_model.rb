class AddAboutAndJobToUserModel < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :job, :string
  end
end
