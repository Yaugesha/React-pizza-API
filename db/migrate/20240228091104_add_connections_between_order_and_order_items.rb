class AddConnectionsBetweenOrderAndOrderItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :order_items, :order, null: false
    add_reference :order_items, :pizza, null: false
  end
end
