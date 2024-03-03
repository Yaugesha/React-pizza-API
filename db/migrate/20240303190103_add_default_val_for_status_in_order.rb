class AddDefaultValForStatusInOrder < ActiveRecord::Migration[7.1]
  def up
    change_column :orders, :status, :string, default: "Preparing"
  end

  def down
    change_column :orders, :status, :string, default: ""
  end
end
