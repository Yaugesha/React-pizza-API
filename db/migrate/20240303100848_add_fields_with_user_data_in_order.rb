class AddFieldsWithUserDataInOrder < ActiveRecord::Migration[7.1]
  def change
    change_table :orders do |t|
      t.string :customer
      t.string :phone
      t.string :address
    end
  end
end
