class CreatePizzas < ActiveRecord::Migration[7.1]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.float :unitPrice
      t.boolean :soldOut
      t.string :imageUrl

      t.timestamps
    end
  end
end
