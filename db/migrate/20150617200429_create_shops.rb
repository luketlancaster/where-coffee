class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :state
      t.string :machine
      t.string :roaster
      t.boolean :multi
      t.references :user, index: true, foreign_key: true
      t.decimal :ppc
      t.string :city

      t.timestamps null: false
    end
  end
end
