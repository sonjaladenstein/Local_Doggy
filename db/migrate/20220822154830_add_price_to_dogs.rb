class AddPriceToDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :price, :integer
  end
end
